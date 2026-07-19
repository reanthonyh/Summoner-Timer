import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/game_match/game_participant.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

import 'game_event.dart';
import 'game_state.dart';

final class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<LoadGameEvent>(_onLoadGame);
    on<RetryLoadGameEvent>(_onRetryLoadGame);
    on<ResumeTimersEvent>(_onResumeTimers);
    on<StartSpellTimerEvent>(_onStartSpellTimer);
    on<PrepareSpellTimerEvent>(_onPrepareSpellTimer);
    on<TickTimersEvent>(_onTickTimers);
    on<ReorderEnemyPlayersEvent>(_onReorderEnemyPlayers);
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

      if (!timer.isRunning) {
        updatedTimers[entry.key] = timer;
        continue;
      }

      final elapsed = now.difference(timer.startedAt).inSeconds;
      final remaining = timer.totalSeconds - elapsed;

      if (remaining > 0) {
        updatedTimers[entry.key] = SpellTimer(
          remainingSeconds: remaining,
          totalSeconds: timer.totalSeconds,
          startedAt: timer.startedAt,
          isRunning: true,
        );
      } else {
        // Timer finished: keep the entry so UI can show a "prepared" state and
        // allow users to restart it via long-press.
        updatedTimers[entry.key] = SpellTimer(
          remainingSeconds: timer.totalSeconds,
          totalSeconds: timer.totalSeconds,
          startedAt: now,
          isRunning: false,
        );
      }
    }

    return updatedTimers;
  }

  void _onLoadGame(LoadGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: UiStatus.loading));
    final result = await _getCurrentGameUseCase();

    result.fold(
      (gameInfo) {
        final enemyPlayerOrder = gameInfo.players
            .where((p) => p.team == Team.enemy)
            .map((p) => p.riotId)
            .toList();
        emit(
          state.copyWith(
            status: UiStatus.success,
            gameInformation: gameInfo,
            enemyPlayerOrder: enemyPlayerOrder,
          ),
        );
      },
      (failure) => emit(state.copyWith(status: UiStatus.error, message: failure.message)),
    );
  }

  void _onRetryLoadGame(RetryLoadGameEvent event, Emitter<GameState> emit) {
    add(const GameEvent.loadGame());
  }

  void _onResumeTimers(ResumeTimersEvent event, Emitter<GameState> emit) {
    final updatedTimers = _calculateUpdatedTimers(state.activeTimers);
    emit(state.copyWith(activeTimers: updatedTimers));

    if (_hasRunningTimers(updatedTimers)) {
      _startTicker();
    } else {
      _stopTicker();
    }
  }

  bool _hasRunningTimers(Map<String, SpellTimer> timers) {
    return timers.values.any((timer) => timer.isRunning);
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
      isRunning: true,
    );

    final updatedTimers = Map<String, SpellTimer>.from(state.activeTimers);
    updatedTimers[timerKey] = timer;

    emit(state.copyWith(activeTimers: updatedTimers));
    _startTicker();
  }

  void _onPrepareSpellTimer(PrepareSpellTimerEvent event, Emitter<GameState> emit) {
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
      isRunning: false,
    );

    final updatedTimers = Map<String, SpellTimer>.from(state.activeTimers);
    updatedTimers[timerKey] = timer;

    emit(state.copyWith(activeTimers: updatedTimers));
  }

  void _onTickTimers(TickTimersEvent event, Emitter<GameState> emit) {
    final updatedTimers = _calculateUpdatedTimers(state.activeTimers);

    // Check if anything actually changed (all timers might have same remaining seconds if tick is fast)
    // or if the list became empty.
    emit(state.copyWith(activeTimers: updatedTimers));

    if (!_hasRunningTimers(updatedTimers)) {
      _stopTicker();
    }
  }

  void _onReorderEnemyPlayers(ReorderEnemyPlayersEvent event, Emitter<GameState> emit) {
    final currentOrder = List<String>.from(state.enemyPlayerOrder);

    if (event.oldIndex < 0 ||
        event.oldIndex >= currentOrder.length ||
        event.newIndex < 0 ||
        event.newIndex >= currentOrder.length ||
        event.oldIndex == event.newIndex) {
      return;
    }

    final item = currentOrder.removeAt(event.oldIndex);
    currentOrder.insert(event.newIndex, item);

    emit(state.copyWith(enemyPlayerOrder: currentOrder));
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
