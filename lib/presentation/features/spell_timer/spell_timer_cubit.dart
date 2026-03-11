import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

import 'spell_timer_state.dart';

final class SpellTimerCubit extends Cubit<SpellTimerState> {
  SpellTimerCubit({required SummonerSpell spell})
    : super(SpellTimerState(remainingSeconds: spell.cooldownSeconds)) {
    _cooldownSeconds = spell.cooldownSeconds;
  }

  Timer? _timer;
  late final int _cooldownSeconds;
  DateTime? _endTime;

  void startTimer() {
    if (state.remainingSeconds <= 0) return;

    _timer?.cancel();

    _endTime = DateTime.now().add(Duration(seconds: state.remainingSeconds));

    emit(
      state.copyWith(
        remainingSeconds: state.remainingSeconds,
        isActive: true,
        progress: 0.0,
      ),
    );

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final now = DateTime.now();
      final remaining = _endTime!.difference(now).inSeconds;

      if (remaining <= 0) {
        timer.cancel();
        _reset();
      } else {
        final elapsed = _cooldownSeconds - remaining;
        emit(
          state.copyWith(
            remainingSeconds: remaining,
            progress: elapsed / _cooldownSeconds,
          ),
        );
      }
    });
  }

  void _reset() {
    _timer?.cancel();
    _endTime = null;
    emit(
      state.copyWith(remainingSeconds: _cooldownSeconds, isActive: false, progress: 1.0),
    );
  }

  void resetTimer() {
    _timer?.cancel();
    _reset();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
