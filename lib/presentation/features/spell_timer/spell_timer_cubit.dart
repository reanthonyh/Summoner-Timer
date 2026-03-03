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

  void startTimer() {
    if (state.remainingSeconds <= 0) return;

    _timer?.cancel();

    emit(
      state.copyWith(remainingSeconds: _cooldownSeconds, isActive: true, progress: 0.0),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        emit(
          state.copyWith(
            remainingSeconds: state.remainingSeconds - 1,
            progress: 1.0 - (state.remainingSeconds - 1) / _cooldownSeconds,
          ),
        );
      } else {
        timer.cancel();
        _reset();
      }
    });
  }

  void _reset() {
    _timer?.cancel();
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
