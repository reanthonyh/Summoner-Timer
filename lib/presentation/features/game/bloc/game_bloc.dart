import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

import 'game_event.dart';
import 'game_state.dart';

final class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<LoadGameEvent>(_onLoadGame);
    on<RetryLoadGameEvent>(_onRetryLoadGame);
    on<ResumeTimersEvent>(_onResumeTimers);
    on<StartSpellTimerEvent>(_onStartSpellTimer);
    on<TickTimersEvent>(_onTickTimers);
  }

  final _getCurrentGameUseCase = getIt<GetCurrentGameUseCase>();

  Timer? _ticker;

  void _startTicker() {
    if (_ticker?.isActive ?? false) return;
    
    _ticker?.cancel();
    _ticker = Timer.periodic(
      const Duration(seconds: 1), 
      (_) => add(const GameEvent.tickTimers()),
    );
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  Map<String, SpellTimer> _calculateUpdatedTimers(Map<String, SpellTimer> currentTimers) {
    if (currentTimers.isEmpty) return {};
    
    final now = DateTime.now();
    final updatedTimers = <String, SpellTimer>{};

    for (final entry in currentTimers.entries) {
      final timer = entry.value;
      final elapsed = now.difference(timer.startedAt).inSeconds;
      final remaining = timer.totalSeconds - elapsed;

      if (remaining > 0) {
        updatedTimers[entry.key] = SpellTimer(
          remainingSeconds: remaining,
          totalSeconds: timer.totalSeconds,
          startedAt: timer.startedAt,
        );
      }
    }
    return updatedTimers;
  }

  void _onLoadGame(LoadGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: UiStatus.loading));
    final result = await _getCurrentGameUseCase();

    result.fold(
      (gameInfo) => emit(state.copyWith(status: UiStatus.success, gameInformation: gameInfo)),
      (failure) => emit(state.copyWith(status: UiStatus.error, message: failure.message)),
    );
  }

  void _onRetryLoadGame(RetryLoadGameEvent event, Emitter<GameState> emit) {
    add(const GameEvent.loadGame());
  }

  void _onResumeTimers(ResumeTimersEvent event, Emitter<GameState> emit) {
    final updatedTimers = _calculateUpdatedTimers(state.activeTimers);
    emit(state.copyWith(activeTimers: updatedTimers));

    if (updatedTimers.isNotEmpty) {
      _startTicker();
    } else {
      _stopTicker();
    }
  }

  void _onStartSpellTimer(StartSpellTimerEvent event, Emitter<GameState> emit) {
    final gameInfo = state.gameInformation;
    if (gameInfo == null) return;

    final participant = gameInfo.players.firstWhere(
      (p) => p.riotId == event.participantId,
      orElse: () => throw Exception('Participant not found'),
    );

    final spell = event.spellSlot == 1 ? participant.spellOne : participant.spellTwo;
    final timerKey = '${event.participantId}_${event.spellSlot}';

    final timer = SpellTimer(
      remainingSeconds: spell.cooldownSeconds,
      totalSeconds: spell.cooldownSeconds,
      startedAt: DateTime.now(),
    );

    final updatedTimers = Map<String, SpellTimer>.from(state.activeTimers);
    updatedTimers[timerKey] = timer;

    emit(state.copyWith(activeTimers: updatedTimers));
    _startTicker();
  }

  void _onTickTimers(TickTimersEvent event, Emitter<GameState> emit) {
    final updatedTimers = _calculateUpdatedTimers(state.activeTimers);
    
    // Check if anything actually changed (all timers might have same remaining seconds if tick is fast)
    // or if the list became empty.
    emit(state.copyWith(activeTimers: updatedTimers));

    if (updatedTimers.isEmpty) {
      _stopTicker();
    }
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
