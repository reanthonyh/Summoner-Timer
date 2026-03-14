import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';

part 'search_form_state.freezed.dart';

@freezed
abstract class SearchFormState with _$SearchFormState {
  const factory SearchFormState({
    String? name,
    String? tag,
    required UiStatus status,
    String? message,
  }) = _SearchFormState;

  factory SearchFormState.initial() => const SearchFormState(status: .initial);
}
