import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/features/profile/widgets/summoner_spell_box.dart';
import 'package:summoner_timer/presentation/features/spell_timer/enemy_team_spell_timers_cubit.dart';
import 'package:summoner_timer/presentation/features/spell_timer/enemy_team_spell_timers_state.dart';

final class GameGrid extends StatelessWidget {
  const GameGrid({super.key, required this.gameInformation});

  final GameInformation gameInformation;

  @override
  Widget build(BuildContext context) {
    final team = gameInformation.players.where((p) => p.team == Team.ally).toList();
    final enemies = gameInformation.players.where((p) => p.team == Team.enemy).toList();

    return BlocProvider(
      create: (_) => EnemyTeamSpellTimersCubit(enemies: enemies),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 800;

          if (isNarrow || team.isEmpty) {
            return _EnemyColumn(enemies: enemies);
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _AllyColumn(team: team)),
              const VerticalDivider(width: 32),
              Expanded(child: _EnemyColumn(enemies: enemies)),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// Ally column (display-only)
// =============================================================================

class _AllyColumn extends StatelessWidget {
  const _AllyColumn({required this.team});

  final List<GameParticipant> team;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SectionHeader('YOUR TEAM'),
        ...team.map(
          (p) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: _AllyParticipantRow(participant: p),
          ),
        ),
      ],
    );
  }
}

class _AllyParticipantRow extends StatelessWidget {
  const _AllyParticipantRow({required this.participant});

  final GameParticipant participant;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SummonerSpellBox(spell: participant.spellOne),
        SummonerSpellBox(spell: participant.spellTwo),
        const SizedBox(width: 8),
        Text(participant.riotId),
      ],
    );
  }
}

// =============================================================================
// Enemy column (timer-enabled)
// =============================================================================

class _EnemyColumn extends StatelessWidget {
  const _EnemyColumn({required this.enemies});

  final List<GameParticipant> enemies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SectionHeader('ENEMIES'),
        ...enemies.asMap().entries.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: _EnemyParticipantRow(participant: e.value),
          ),
        ),
      ],
    );
  }
}

class _EnemyParticipantRow extends StatelessWidget {
  const _EnemyParticipantRow({required this.participant});

  final GameParticipant participant;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnemyTeamSpellTimersCubit, EnemyTeamSpellTimersState>(
      builder: (context, state) {
        final cubit = context.read<EnemyTeamSpellTimersCubit>();
        final keyOne = '${participant.riotId}_spellOne';
        final keyTwo = '${participant.riotId}_spellTwo';
        final dataOne = state.spellTimers[keyOne];
        final dataTwo = state.spellTimers[keyTwo];

        return Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            SummonerSpellBox(
              spell: participant.spellOne,
              isActive: dataOne?.isActive ?? false,
              remainingSeconds: dataOne?.remainingSeconds,
              progress: dataOne?.progress ?? 1.0,
              onTap: () => cubit.startSpellTimer(keyOne),
              onLongPress: () => cubit.resetSpellTimer(keyOne),
            ),
            SummonerSpellBox(
              spell: participant.spellTwo,
              isActive: dataTwo?.isActive ?? false,
              remainingSeconds: dataTwo?.remainingSeconds,
              progress: dataTwo?.progress ?? 1.0,
              onTap: () => cubit.startSpellTimer(keyTwo),
              onLongPress: () => cubit.resetSpellTimer(keyTwo),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: Text(participant.riotId, overflow: TextOverflow.ellipsis),
            ),
          ],
        );
      },
    );
  }
}

// =============================================================================
// Shared
// =============================================================================

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
