import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/game/bloc/game_cubit.dart';
import 'package:summoner_timer/presentation/game/bloc/game_state.dart';
import 'package:summoner_timer/presentation/game/widgets/summoner_spell_card.dart';

final class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    context.read<GameCubit>().fetchCurrentGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Tracker'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<GameCubit>().fetchCurrentGame(),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text(
                'Fetching current game...',
                style: TextStyle(color: Colors.white),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (gameInfo) => _buildGameView(context, gameInfo),
            error: (message) => Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameView(BuildContext context, GameInformation gameInfo) {
    final enemyTeam = gameInfo.players.where((p) => p.team == Team.enemy).toList();
    final allyTeam = gameInfo.players.where((p) => p.team == Team.ally).toList();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'ENEMY TEAM',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: enemyTeam.length,
            itemBuilder: (context, index) {
              final player = enemyTeam[index];
              return _buildPlayerRow(player);
            },
          ),
        ),
        const Divider(color: Colors.grey),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'ALLY TEAM',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: allyTeam.length,
            itemBuilder: (context, index) {
              final player = allyTeam[index];
              return _buildPlayerRow(player);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerRow(GameParticipant player) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: player.team == Team.enemy
                ? Colors.red.withOpacity(0.2)
                : Colors.blue.withOpacity(0.2),
            child: Icon(
              Icons.person,
              color: player.team == Team.enemy ? Colors.red : Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.riotId,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Champ: ${player.championId}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: SummonerSpellCard(spell: player.spellOne),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 60,
            height: 60,
            child: SummonerSpellCard(spell: player.spellTwo),
          ),
        ],
      ),
    );
  }
}
