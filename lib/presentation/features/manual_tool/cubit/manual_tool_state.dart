import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';
import 'package:summoner_timer/presentation/features/spell_timer/enemy_team_spell_timers_state.dart';

part 'manual_tool_state.freezed.dart';

class ManualEnemy {
  ManualEnemy({SummonerSpell? spellOne, SummonerSpell? spellTwo})
    : spellOne = spellOne ?? _defaultSpell,
      spellTwo = spellTwo ?? _defaultSpell;

  final SummonerSpell spellOne;
  final SummonerSpell spellTwo;

  static const _defaultSpell = SummonerSpell(
    id: '',
    name: 'Select',
    cooldownSeconds: 0,
    spriteUrl: '',
    imageUrl: '',
  );

  bool get isValid => spellOne.id.isNotEmpty && spellTwo.id.isNotEmpty;

  ManualEnemy copyWith({SummonerSpell? spellOne, SummonerSpell? spellTwo}) {
    return ManualEnemy(
      spellOne: spellOne ?? this.spellOne,
      spellTwo: spellTwo ?? this.spellTwo,
    );
  }
}

enum ManualToolMode { setup, action }

@freezed
abstract class ManualToolState with _$ManualToolState {
  const factory ManualToolState({
    @Default(ManualToolMode.setup) ManualToolMode mode,
    @Default([]) List<ManualEnemy> enemies,
    @Default([]) List<SummonerSpell> availableSpells,
    @Default({}) Map<String, SpellTimerData> spellTimers,
  }) = _ManualToolState;
}
