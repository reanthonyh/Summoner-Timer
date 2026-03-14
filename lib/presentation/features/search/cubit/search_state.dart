import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    String? name,
    String? tag,

    @Default([]) List<Account> recentAccounts,

    required UiStatus status,
    String? message,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(status: .initial);
}
