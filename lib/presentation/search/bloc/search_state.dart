import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(List<Account> accounts) = _Loaded;
  const factory SearchState.success(Account account) = _Success;
  const factory SearchState.error(String message) = _Error;
}
