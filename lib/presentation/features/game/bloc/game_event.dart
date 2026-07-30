import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.freezed.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  const factory GameEvent.loadGame() = _LoadGameEvent;
  const factory GameEvent.retryLoadGame() = _RetryLoadGameEvent;
  const factory GameEvent.resumeTimers() = _ResumeTimersEvent;
  const factory GameEvent.startSpellTimer({
    required String participantId,
    required int spellSlot,
  }) = _StartSpellTimerEvent;
  const factory GameEvent.prepareSpellTimer({
    required String participantId,
    required int spellSlot,
  }) = _PrepareSpellTimerEvent;
  const factory GameEvent.tickTimers() = _TickTimersEvent;
  const factory GameEvent.reorderEnemyPlayers({
    required int oldIndex,
    required int newIndex,
  }) = _ReorderEnemyPlayersEvent;
}
