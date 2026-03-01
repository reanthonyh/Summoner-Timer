import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';
import 'package:summoner_timer/domain/usecases/get_summoner_spells_usecase.dart';

import 'manual_tool_state.dart';

final class ManualToolCubit extends Cubit<ManualToolState> {
  ManualToolCubit() : super(const ManualToolState()) {
    _loadSpells();
  }

  final _getSummonerSpellsUC = getIt<GetSummonerSpellsUseCase>();

  Future<void> _loadSpells() async {
    final spells = await _getSummonerSpellsUC.call();
    final enemies = List.generate(5, (_) => ManualEnemy());
    emit(state.copyWith(availableSpells: spells, enemies: enemies));
  }

  void updateEnemyName(int index, String name) {
    if (index < 0 || index >= state.enemies.length) return;
    final enemies = List<ManualEnemy>.from(state.enemies);
    enemies[index] = enemies[index].copyWith(name: name);
    emit(state.copyWith(enemies: enemies));
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

  void startActionMode() {
    emit(state.copyWith(mode: ManualToolMode.action));
  }

  void backToSetup() {
    emit(state.copyWith(mode: ManualToolMode.setup));
  }

  void reset() {
    final enemies = List.generate(5, (_) => ManualEnemy());
    emit(state.copyWith(enemies: enemies, mode: ManualToolMode.setup));
  }
}
