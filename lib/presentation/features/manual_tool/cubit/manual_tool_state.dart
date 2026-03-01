import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

part 'manual_tool_state.freezed.dart';

class ManualEnemy {
  ManualEnemy({this.name = '', SummonerSpell? spellOne, SummonerSpell? spellTwo})
    : spellOne = spellOne ?? _defaultSpell,
      spellTwo = spellTwo ?? _defaultSpell;

  final String name;
  final SummonerSpell spellOne;
  final SummonerSpell spellTwo;

  static final _defaultSpell = const SummonerSpell(
    id: '',
    name: 'Select',
    cooldownSeconds: 0,
    spriteUrl: '',
    imageUrl: '',
  );

  ManualEnemy copyWith({String? name, SummonerSpell? spellOne, SummonerSpell? spellTwo}) {
    return ManualEnemy(
      name: name ?? this.name,
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
    @Default(5) int enemyCount,
    @Default([]) List<ManualEnemy> enemies,
    @Default([]) List<SummonerSpell> availableSpells,
  }) = _ManualToolState;
}
