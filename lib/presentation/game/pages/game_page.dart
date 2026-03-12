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
      backgroundColor: const Color(0xFF121212),
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text(
                'Fetching current game...',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            loading: () =>
                const Center(child: CircularProgressIndicator(color: Colors.redAccent)),
            loaded: (gameInfo) => _buildSliverView(context, gameInfo),
            error: (message, statusCode, responseBody, errorType) => Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: const Icon(Icons.error_outline, color: Colors.red, size: 48),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Failed to Load Game',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildErrorRow(
                            Icons.message,
                            'Message',
                            message,
                            Colors.redAccent,
                          ),
                          if (statusCode != null) ...[
                            const Divider(color: Colors.white12, height: 24),
                            _buildErrorRow(
                              Icons.tag,
                              'Status Code',
                              statusCode.toString(),
                              Colors.orange,
                            ),
                          ],
                          if (errorType != null) ...[
                            const Divider(color: Colors.white12, height: 24),
                            _buildErrorRow(
                              Icons.warning_amber,
                              'Error Type',
                              errorType,
                              Colors.amber,
                            ),
                          ],
                          if (responseBody != null && responseBody.isNotEmpty) ...[
                            const Divider(color: Colors.white12, height: 24),
                            _buildErrorRow(
                              Icons.code,
                              'Response',
                              responseBody.length > 500
                                  ? '${responseBody.substring(0, 500)}...'
                                  : responseBody,
                              Colors.blueGrey,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => context.read<GameCubit>().fetchCurrentGame(),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSliverView(BuildContext context, GameInformation gameInfo) {
    final enemyTeam = gameInfo.players.where((p) => p.team == Team.enemy).toList();
    final allyTeam = gameInfo.players.where((p) => p.team == Team.ally).toList();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 120.0,
          floating: true,
          pinned: true,
          backgroundColor: const Color(0xFF1A1A1A),
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'GAME TRACKER',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2A2A2A), Color(0xFF121212)],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<GameCubit>().fetchCurrentGame(),
            ),
          ],
        ),
        _buildTeamHeader('ENEMY TEAM', Colors.redAccent),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _AnimatedPlayerRow(player: enemyTeam[index], index: index);
          }, childCount: enemyTeam.length),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Colors.white10, thickness: 2),
          ),
        ),
        _buildTeamHeader('ALLY TEAM', Colors.blueAccent),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _AnimatedPlayerRow(
              player: allyTeam[index],
              index: index + enemyTeam.length,
            );
          }, childCount: allyTeam.length),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
      ],
    );
  }

  Widget _buildTeamHeader(String title, Color color) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorRow(IconData icon, String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              SelectableText(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnimatedPlayerRow extends StatelessWidget {
  const _AnimatedPlayerRow({required this.player, required this.index});

  final GameParticipant player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: player.team == Team.enemy
                      ? Colors.redAccent.withValues(alpha: 0.3)
                      : Colors.blueAccent.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFF2A2A2A),
                child: Icon(
                  Icons.person,
                  color: player.team == Team.enemy ? Colors.redAccent : Colors.blueAccent,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.riotId,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Champion ID: ${player.championId}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 54,
              height: 54,
              child: SummonerSpellCard(spell: player.spellOne),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 54,
              height: 54,
              child: SummonerSpellCard(spell: player.spellTwo),
            ),
          ],
        ),
      ),
    );
  }
}
