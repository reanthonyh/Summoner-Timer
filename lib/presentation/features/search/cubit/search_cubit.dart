import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'search_state.dart';

final class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial()) {
    _fetchRecentAccounts();
  }

  final _searchAccountUseCase = getIt<GetAccountUseCase>();
  final _getRecentAccounts = getIt<GetSavedAccountsUseCase>();

  void _fetchRecentAccounts() async {
    emit(state.copyWith(status: .loading));

    final recentAccounts = await _getRecentAccounts();

    recentAccounts.when(
      success: (data) {
        emit(state.copyWith(status: .initial, recentAccounts: data));
      },
      failure: (error) {
        emit(state.copyWith(status: .error, message: "Not found recent accounts"));
      },
    );
  }

  void updateName(String? name) => emit(state.copyWith(name: name));

  void updateTag(String? tag) => emit(state.copyWith(tag: tag));

  void searchWithRiotID() async {
    emit(state.copyWith(status: .loading));

    if (state.name == null && state.tag == null) return;

    final result = await _searchAccountUseCase(
      riotId: (name: state.name!, tag: state.tag!),
    );

    result.when(
      success: (_) {
        emit(state.copyWith(status: .success));
      },
      failure: (error) {
        print('SearchCubit - searchWithRiotID : $error');
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
        print('SearchCubit - searchWithPUUID : $error');
        emit(state.copyWith(status: .error, message: "Failure on search that account"));
      },
    );
  }
}
