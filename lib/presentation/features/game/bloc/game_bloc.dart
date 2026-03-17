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
    on<GameViewEvent>(_onGameView);
    on<ResumeTimersEvent>(_onResumeTimers);
    on<StartSpellTimerEvent>(_onStartSpellTimer);
    on<TickTimersEvent>(_onTickTimers);
  }

  final _getCurrentGameUseCase = getIt<GetCurrentGameUseCase>();

  Timer? _ticker;

  void _startTicker() {
    const second = Duration(seconds: 1);

    _ticker?.cancel();
    _ticker = Timer.periodic(second, (_) => add(const GameEvent.tickTimers()));
  }

  void _onLoadGame(LoadGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: .loading));
    final result = await _getCurrentGameUseCase();

    result.fold(
      (gameInfo) => emit(state.copyWith(status: .success, gameInformation: gameInfo)),
      (failure) => emit(state.copyWith(status: .error, message: failure.message)),
    );
  }

  void _onRetryLoadGame(RetryLoadGameEvent event, Emitter<GameState> emit) {
    add(const GameEvent.loadGame());
  }

  void _onGameView(GameViewEvent event, Emitter<GameState> emit) {
    if (state.status.isSuccess) {
      _startTicker();
    }
  }

  void _onResumeTimers(ResumeTimersEvent event, Emitter<GameState> emit) {
    final now = DateTime.now();
    final updatedTimers = <String, SpellTimer>{};

    for (final entry in state.activeTimers.entries) {
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

    emit(state.copyWith(activeTimers: updatedTimers));

    if (state.activeTimers.isNotEmpty && _ticker?.isActive != true) {
      _startTicker();
    } else if (state.activeTimers.isEmpty) {
      _ticker?.cancel();
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

    if (_ticker?.isActive != true) {
      _startTicker();
    }
  }

  void _onTickTimers(TickTimersEvent event, Emitter<GameState> emit) {
    final now = DateTime.now();
    final updatedTimers = <String, SpellTimer>{};
    bool hasActiveTimers = false;

    for (final entry in state.activeTimers.entries) {
      final timer = entry.value;
      final elapsed = now.difference(timer.startedAt).inSeconds;
      final remaining = timer.totalSeconds - elapsed;

      if (remaining > 0) {
        updatedTimers[entry.key] = SpellTimer(
          remainingSeconds: remaining,
          totalSeconds: timer.totalSeconds,
          startedAt: timer.startedAt,
        );
        hasActiveTimers = true;
      }
    }

    emit(state.copyWith(activeTimers: updatedTimers));

    if (!hasActiveTimers) {
      _ticker?.cancel();
    }
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
