import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/features/profile/widgets/summoner_spell_box.dart';

final class GameGrid extends StatelessWidget {
  const GameGrid({super.key, required this.gameInformation});

  final GameInformation gameInformation;

  @override
  Widget build(BuildContext context) {
    final players = gameInformation.players;

    final team = players.where((p) => p.team == Team.ally).toList();
    final enemies = players.where((p) => p.team == Team.enemy).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 800;

        if (isNarrow || team.isEmpty) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'ENEMIES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ...enemies.map(
                (p) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _ParticipantCard(p),
                ),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'YOUR TEAM',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  ...team.map(
                    (p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _TeamParticipantCard(p),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 32),
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'ENEMIES',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  ...enemies.map(
                    (p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _ParticipantCard(p),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

final class _TeamParticipantCard extends StatelessWidget {
  const _TeamParticipantCard(this.participant);

  final GameParticipant participant;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            participant.spellOne.spriteUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            participant.spellTwo.spriteUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Text(participant.riotId),
      ],
    );
  }
}

final class _ParticipantCard extends StatelessWidget {
  const _ParticipantCard(this.participant);

  final GameParticipant participant;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisSize: .min,
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        SummonerSpellBox(spell: participant.spellOne),
        SummonerSpellBox(spell: participant.spellTwo),
        const SizedBox(width: 8),
        Text(participant.riotId),
      ],
    );
  }
}
