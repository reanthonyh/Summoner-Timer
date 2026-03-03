import 'package:freezed_annotation/freezed_annotation.dart';

part 'spell_timer_state.freezed.dart';

@freezed
abstract class SpellTimerState with _$SpellTimerState {
  const factory SpellTimerState({
    @Default(0) int remainingSeconds,
    @Default(false) bool isActive,
    @Default(1.0) double progress,
  }) = _SpellTimerState;
}
