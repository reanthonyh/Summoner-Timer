import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'recent_accounts_state.freezed.dart';

@freezed
abstract class RecentAccountsState with _$RecentAccountsState {
  const factory RecentAccountsState({
    @Default([]) List<Account> recentAccounts,
    required UiStatus status,
    String? message,
  }) = _RecentAccountsState;

  factory RecentAccountsState.initial() => const RecentAccountsState(status: .initial);
}
