import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';
import 'package:summoner_timer/domain/usecases/get_saved_accounts_usecase.dart';
import 'package:summoner_timer/domain/usecases/save_account_usecase.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required GetAccountUseCase getAccountUseCase,
    required GetSavedAccountsUseCase getSavedAccountsUseCase,
    required SaveAccountUseCase saveAccountUseCase,
  }) : _getAccountUseCase = getAccountUseCase,
       _getSavedAccountsUseCase = getSavedAccountsUseCase,
       _saveAccountUseCase = saveAccountUseCase,
       super(const SearchState.initial()) {
    loadSavedAccounts();
  }

  final GetAccountUseCase _getAccountUseCase;
  final GetSavedAccountsUseCase _getSavedAccountsUseCase;
  final SaveAccountUseCase _saveAccountUseCase;

  Future<void> loadSavedAccounts() async {
    try {
      final accounts = await _getSavedAccountsUseCase();
      emit(SearchState.loaded(accounts));
    } catch (e) {
      emit(const SearchState.error('Failed to load saved accounts'));
    }
  }

  Future<void> search(String name, String tag) async {
    emit(const SearchState.loading());
    try {
      final account = await _getAccountUseCase(riotId: (name: name, tag: tag));
      await _saveAccountUseCase(account);
      emit(SearchState.success(account));
    } catch (e) {
      emit(SearchState.error(e.toString()));
      loadSavedAccounts();
    }
  }

  Future<void> selectSavedAccount(Account account) async {
    emit(const SearchState.loading());
    try {
      // The session implicitly sets it if we look it up or we can just fetch again
      final refreshed = await _getAccountUseCase(puuid: account.puuid);
      emit(SearchState.success(refreshed));
    } catch (e) {
      emit(SearchState.error(e.toString()));
    }
  }
}
