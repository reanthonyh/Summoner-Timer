import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';
import 'package:summoner_timer/domain/usecases/get_summoner_spells_usecase.dart';
import 'package:summoner_timer/presentation/features/spell_timer/enemy_team_spell_timers_state.dart';
import 'package:summoner_timer/presentation/features/spell_timer/spell_timers_cubit_mixin.dart';

import 'manual_tool_state.dart';

final class ManualToolCubit extends Cubit<ManualToolState>
    with SpellTimersMixin<ManualToolState> {
  ManualToolCubit() : super(const ManualToolState()) {
    _loadSpells();
  }

  final _getSummonerSpellsUC = getIt<GetSummonerSpellsUseCase>();

  // ---------------------------------------------------------------------------
  // SpellTimersMixin implementation
  // ---------------------------------------------------------------------------

  @override
  Map<String, SpellTimerData> getSpellTimers(ManualToolState s) => s.spellTimers;

  @override
  ManualToolState withSpellTimers(Map<String, SpellTimerData> timers) =>
      state.copyWith(spellTimers: timers);

  // ---------------------------------------------------------------------------
  // Setup phase
  // ---------------------------------------------------------------------------

  Future<void> _loadSpells() async {
    final spells = await _getSummonerSpellsUC.call();
    final enemies = List.generate(5, (_) => ManualEnemy());
    emit(state.copyWith(availableSpells: spells, enemies: enemies));
  }

  void updateEnemySpellOne(int index, SummonerSpell spell) {
    if (index < 0 || index >= state.enemies.length) return;
    final enemies = List<ManualEnemy>.from(state.enemies);
    enemies[index] = enemies[index].copyWith(spellOne: spell);
    emit(state.copyWith(enemies: enemies));
  }

  void updateEnemySpellTwo(int index, SummonerSpell spell) {
    if (index < 0 || index >= state.enemies.length) return;
    final enemies = List<ManualEnemy>.from(state.enemies);
    enemies[index] = enemies[index].copyWith(spellTwo: spell);
    emit(state.copyWith(enemies: enemies));
  }

  bool get canStartActionMode => state.enemies.every((e) => e.isValid);

  // ---------------------------------------------------------------------------
  // Mode transitions
  // ---------------------------------------------------------------------------

  void startActionMode() {
    if (!canStartActionMode) return;
    emit(state.copyWith(mode: ManualToolMode.action, spellTimers: _buildSpellTimers()));
  }

  void backToSetup() {
    cancelTimer();
    emit(state.copyWith(mode: ManualToolMode.setup, spellTimers: {}));
  }

  void reset() {
    cancelTimer();
    emit(
      state.copyWith(
        enemies: List.generate(5, (_) => ManualEnemy()),
        mode: ManualToolMode.setup,
        spellTimers: {},
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Builds initial [SpellTimerData] entries keyed by enemy index + slot.
  Map<String, SpellTimerData> _buildSpellTimers() {
    final timers = <String, SpellTimerData>{};
    for (var i = 0; i < state.enemies.length; i++) {
      final enemy = state.enemies[i];
      timers['${i}_spellOne'] = SpellTimerData(
        spell: enemy.spellOne,
        remainingSeconds: enemy.spellOne.cooldownSeconds,
        isActive: false,
        progress: 1.0,
      );
      timers['${i}_spellTwo'] = SpellTimerData(
        spell: enemy.spellTwo,
        remainingSeconds: enemy.spellTwo.cooldownSeconds,
        isActive: false,
        progress: 1.0,
      );
    }
    return timers;
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
