import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';

import 'search_state.dart';

final class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(.initial());

  final _getAccountUC = getIt<GetAccountUseCase>();

  bool get isValidToSubmit => state.isValid;

  void onChangeName(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(nameField: value));
    }
  }

  void onChangeTag(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(tagField: value));
    }
  }

  Future<void> submit() async {
    if (!isValidToSubmit) return;

    emit(state.copyWith(status: .loading));

    try {
      final account = await _getAccountUC.call(
        name: state.nameField!,
        tag: state.tagField!,
      );

      emit(state.copyWith(status: .success, account: account));
    } catch (err) {
      emit(state.copyWith(status: .error, account: null));
    }
  }
}
