import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/utils/result.dart';
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
    final result = await _getSavedAccountsUseCase();
    result.when(
      success: (accounts) {
        emit(SearchState.loaded(accounts));
      },
      failure: (error) {
        emit(const SearchState.error('Failed to load saved accounts'));
      },
    );
  }

  Future<void> search(String name, String tag) async {
    emit(const SearchState.loading());
    final result = await _getAccountUseCase(riotId: (name: name, tag: tag));

    await result.when(
      success: (account) async {
        await _saveAccountUseCase(account);
        emit(SearchState.success(account));
        await loadSavedAccounts();
      },
      failure: (error) async {
        // Log the full error details for debugging
        // ignore: avoid_print
        print('Search error: $error');
        emit(const SearchState.error('Unable to find that Account'));
      },
    );
  }

  Future<void> selectSavedAccount(Account account) async {
    emit(const SearchState.loading());
    final result = await _getAccountUseCase(puuid: account.puuid);
    await result.when(
      success: (refreshed) async {
        emit(SearchState.success(refreshed));
        await loadSavedAccounts();
      },
      failure: (error) async {
        // Log the full error details for debugging
        // ignore: avoid_print
        print('Search error: $error');
        emit(const SearchState.error('Unable to find that Account'));
      },
    );
  }
}
