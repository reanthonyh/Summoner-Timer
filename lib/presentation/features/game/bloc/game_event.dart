import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.freezed.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  const factory GameEvent.loadGame() = LoadGameEvent;
  const factory GameEvent.retryLoadGame() = RetryLoadGameEvent;
  const factory GameEvent.resumeTimers() = ResumeTimersEvent;
  const factory GameEvent.startSpellTimer({
    required String participantId,
    required int spellSlot,
  }) = StartSpellTimerEvent;
  const factory GameEvent.tickTimers() = TickTimersEvent;
}
