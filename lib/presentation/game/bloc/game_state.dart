import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState.initial() = _Initial;
  const factory GameState.loading() = _Loading;
  const factory GameState.loaded(GameInformation gameInformation) = _Loaded;
  const factory GameState.error({
    required String message,
    int? statusCode,
    String? responseBody,
    String? errorType,
  }) = _Error;
}
