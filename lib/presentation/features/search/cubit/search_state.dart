import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    String? nameField,
    String? tagField,
    Account? account,
    required UiStatus status,
  }) = _SearchState;

  bool get isValid => nameField != null && tagField != null;

  factory SearchState.initial() => const SearchState(status: .initial);
}
