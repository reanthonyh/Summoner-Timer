import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

part 'enemy_team_spell_timers_state.freezed.dart';

class SpellTimerData {
  const SpellTimerData({
    required this.spell,
    required this.remainingSeconds,
    required this.isActive,
    required this.progress,
  });

  final SummonerSpell spell;
  final int remainingSeconds;
  final bool isActive;
  final double progress;

  SpellTimerData copyWith({
    SummonerSpell? spell,
    int? remainingSeconds,
    bool? isActive,
    double? progress,
  }) {
    return SpellTimerData(
      spell: spell ?? this.spell,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isActive: isActive ?? this.isActive,
      progress: progress ?? this.progress,
    );
  }
}

@freezed
abstract class EnemyTeamSpellTimersState with _$EnemyTeamSpellTimersState {
  const factory EnemyTeamSpellTimersState({
    @Default({}) Map<String, SpellTimerData> spellTimers,
  }) = _EnemyTeamSpellTimersState;
}
