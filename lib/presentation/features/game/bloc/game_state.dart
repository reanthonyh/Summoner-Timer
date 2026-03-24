import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'game_state.freezed.dart';

final class SpellTimer {
  const SpellTimer({
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.startedAt,
    required this.isRunning,
  });

  final int remainingSeconds;
  final int totalSeconds;
  final DateTime startedAt;
  final bool isRunning;
}

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    GameInformation? gameInformation,
    required UiStatus status,
    String? message,
    @Default({}) Map<String, SpellTimer> activeTimers,
    @Default([]) List<String> enemyPlayerOrder,
  }) = _GameState;

  factory GameState.initial() =>
      const GameState(status: UiStatus.initial, enemyPlayerOrder: []);
}
