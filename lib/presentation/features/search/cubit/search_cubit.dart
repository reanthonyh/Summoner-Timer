import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';
import 'package:summoner_timer/domain/usecases/get_saved_accounts_usecase.dart';
import 'package:summoner_timer/domain/usecases/save_account_usecase.dart';
import 'package:summoner_timer/domain/usecases/set_account_usecase.dart';

import 'search_state.dart';

final class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(.initial()) {
    _getSavedAccounts();
  }

  final _getAccountUC = getIt<GetAccountUseCase>();
  final _getSavedAccountsUC = getIt<GetSavedAccountsUseCase>();
  final _saveAccountUC = getIt<SaveAccountUseCase>();
  final _setAccountUC = getIt<SetAccountUseCase>();

  bool get isValidToSubmit => state.isValid;

  Future<void> _getSavedAccounts() async {
    emit(state.copyWith(status: UiStatus.loading));
    final response = await _getSavedAccountsUC.call();

    emit(state.copyWith(status: UiStatus.success, savedAccounts: response));
  }

  void onChangeName(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(nameField: value, status: UiStatus.initial));
    }
  }

  void onChangeTag(String? value) {
    if (value != null && value.isNotEmpty) {
      emit(state.copyWith(tagField: value, status: UiStatus.initial));
    }
  }

  Future<void> submit() async {
    if (!isValidToSubmit) return;

    emit(state.copyWith(status: .loading));

    try {
      final account = await _getAccountUC.call(
        riotId: (name: state.nameField!, tag: state.tagField!),
      );

      await _saveAccountUC.call(account);
      final savedAccounts = await _getSavedAccountsUC.call();
      emit(
        state.copyWith(status: .success, account: account, savedAccounts: savedAccounts),
      );
    } catch (err) {
      emit(state.copyWith(status: .error, account: null));
    }
  }

  void selectAccount(Account account) async {
    _setAccountUC.call(account);
    emit(state.copyWith(status: UiStatus.success, account: account));
  }
}
