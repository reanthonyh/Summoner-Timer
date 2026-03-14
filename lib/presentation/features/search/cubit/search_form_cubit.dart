import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'search_form_state.dart';

final class SearchFormCubit extends Cubit<SearchFormState> {
  SearchFormCubit() : super(SearchFormState.initial());

  final _searchAccountUseCase = getIt<GetAccountUseCase>();
  final _saveAccountUseCase = getIt<SaveAccountUseCase>();

  void updateName(String? name) => emit(state.copyWith(name: name));

  void updateTag(String? tag) => emit(state.copyWith(tag: tag));

  void searchWithRiotID() async {
    emit(state.copyWith(status: .loading));

    if (state.name == null && state.tag == null) return;

    final result = await _searchAccountUseCase(
      riotId: (name: state.name!, tag: state.tag!),
    );

    result.when(
      success: (data) async {
        await _saveAccountUseCase(data);
        emit(state.copyWith(status: .success));
      },
      failure: (error) {
        print('SearchFormCubit - searchWithRiotID : $error');
        emit(
          state.copyWith(status: .error, message: "Not found account with that RiotID"),
        );
      },
    );
  }

  void searchWithPUUID(String puuid) async {
    emit(state.copyWith(status: .loading));

    final result = await _searchAccountUseCase(puuid: puuid);

    result.when(
      success: (_) {
        emit(state.copyWith(status: .success));
      },
      failure: (error) {
        print('SearchFormCubit - searchWithPUUID : $error');
        emit(state.copyWith(status: .error, message: "Failure on search that account"));
      },
    );
  }
}
