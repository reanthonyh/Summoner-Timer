import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    GameInformation? gameInformation,
    required UiStatus status,
    String? message,
  }) = _GameState;

  factory GameState.initial() => const GameState(status: UiStatus.initial);
}
