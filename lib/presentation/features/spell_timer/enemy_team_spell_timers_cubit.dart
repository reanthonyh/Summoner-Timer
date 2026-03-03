import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/game_participant.dart';

import 'enemy_team_spell_timers_state.dart';
import 'spell_timers_cubit_mixin.dart';

final class EnemyTeamSpellTimersCubit extends Cubit<EnemyTeamSpellTimersState>
    with SpellTimersMixin<EnemyTeamSpellTimersState> {
  EnemyTeamSpellTimersCubit({List<GameParticipant>? enemies})
    : super(const EnemyTeamSpellTimersState()) {
    if (enemies != null) {
      _initializeSpells(enemies);
    }
  }

  // ---------------------------------------------------------------------------
  // SpellTimersMixin implementation
  // ---------------------------------------------------------------------------

  @override
  Map<String, SpellTimerData> getSpellTimers(EnemyTeamSpellTimersState s) =>
      s.spellTimers;

  @override
  EnemyTeamSpellTimersState withSpellTimers(Map<String, SpellTimerData> timers) =>
      state.copyWith(spellTimers: timers);

  // ---------------------------------------------------------------------------
  // Initialisation
  // ---------------------------------------------------------------------------

  void _initializeSpells(List<GameParticipant> enemies) {
    final Map<String, SpellTimerData> spellTimers = {};

    for (final enemy in enemies) {
      spellTimers['${enemy.riotId}_spellOne'] = SpellTimerData(
        spell: enemy.spellOne,
        remainingSeconds: enemy.spellOne.cooldownSeconds,
        isActive: false,
        progress: 1.0,
      );
      spellTimers['${enemy.riotId}_spellTwo'] = SpellTimerData(
        spell: enemy.spellTwo,
        remainingSeconds: enemy.spellTwo.cooldownSeconds,
        isActive: false,
        progress: 1.0,
      );
    }

    emit(state.copyWith(spellTimers: spellTimers));
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<void> close() {
    cancelTimer();
    return super.close();
  }
}
