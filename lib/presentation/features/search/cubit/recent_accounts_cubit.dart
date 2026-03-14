import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'recent_accounts_state.dart';

final class RecentAccountsCubit extends Cubit<RecentAccountsState> {
  RecentAccountsCubit() : super(RecentAccountsState.initial()) {
    _fetchRecentAccounts();
  }

  final _getSavedAccountsUseCase = getIt<GetSavedAccountsUseCase>();

  void _fetchRecentAccounts() async {
    emit(state.copyWith(status: .loading));

    final recentAccounts = await _getSavedAccountsUseCase();

    recentAccounts.when(
      success: (data) {
        emit(state.copyWith(status: .initial, recentAccounts: data));
      },
      failure: (error) {
        emit(state.copyWith(status: .error, message: "Not found recent accounts"));
      },
    );
  }

  void refresh() => _fetchRecentAccounts();
}
