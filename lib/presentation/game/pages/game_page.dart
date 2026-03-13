import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/game/bloc/game_cubit.dart';
import 'package:summoner_timer/presentation/game/bloc/game_state.dart';
import 'package:summoner_timer/presentation/game/widgets/summoner_spell_card.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _activeTimers = 0;

  void _onTimerStateChanged(bool isActive) {
    setState(() {
      if (isActive) {
        _activeTimers++;
      } else {
        _activeTimers--;
      }
    });
    WakelockPlus.toggle(enable: _activeTimers > 0);
  }

  @override
  void initState() {
    super.initState();
    context.read<GameCubit>().fetchCurrentGame();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
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
            loaded: (gameInfo) => _GameSliverView(
              gameInfo: gameInfo,
              onTimerStateChanged: _onTimerStateChanged,
            ),
            error: (message, statusCode, responseBody, errorType) {
              final isNotFound = statusCode == 404 || errorType == 'NOT_FOUND';
              final displayMessage = isNotFound
                  ? 'No Game Live Right Now'
                  : 'An error occurred. Please try again.';

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isNotFound ? Icons.videogame_asset_off : Icons.error_outline,
                      color: Colors.white54,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      displayMessage,
                      style: const TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => context.read<GameCubit>().fetchCurrentGame(),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _GameSliverView extends StatefulWidget {
  final GameInformation gameInfo;
  final Function(bool) onTimerStateChanged;

  const _GameSliverView({required this.gameInfo, required this.onTimerStateChanged});

  @override
  State<_GameSliverView> createState() => _GameSliverViewState();
}

class _GameSliverViewState extends State<_GameSliverView> {
  late List<GameParticipant> _enemyTeam;

  @override
  void initState() {
    super.initState();
    _enemyTeam = widget.gameInfo.players.where((p) => p.team == Team.enemy).toList();
  }

  @override
  void didUpdateWidget(_GameSliverView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gameInfo.matchId != widget.gameInfo.matchId) {
      _enemyTeam = widget.gameInfo.players.where((p) => p.team == Team.enemy).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final allyTeam = widget.gameInfo.players.where((p) => p.team == Team.ally).toList();

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
        const _TeamHeader(title: 'ENEMY TEAM', color: Colors.redAccent),
        SliverToBoxAdapter(
          child: SizedBox(
            height: _enemyTeam.length * 98.0,
            child: ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              buildDefaultDragHandles: false,
              itemCount: _enemyTeam.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  final item = _enemyTeam.removeAt(oldIndex);
                  _enemyTeam.insert(newIndex, item);
                });
              },
              itemBuilder: (context, index) {
                return _AnimatedPlayerRow(
                  key: ValueKey(_enemyTeam[index].riotId + index.toString()),
                  player: _enemyTeam[index],
                  index: index,
                  isEnemy: true,
                  onTimerStateChanged: widget.onTimerStateChanged,
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Colors.white10, thickness: 2),
          ),
        ),
        const _TeamHeader(title: 'ALLY TEAM', color: Colors.blueAccent),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _AnimatedPlayerRow(
              key: ValueKey(allyTeam[index].riotId),
              player: allyTeam[index],
              index: index + _enemyTeam.length,
              isEnemy: false,
              onTimerStateChanged: widget.onTimerStateChanged,
            );
          }, childCount: allyTeam.length),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
      ],
    );
  }
}

class _TeamHeader extends StatelessWidget {
  final String title;
  final Color color;

  const _TeamHeader({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
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
}

class _AnimatedPlayerRow extends StatelessWidget {
  const _AnimatedPlayerRow({
    super.key,
    required this.player,
    required this.index,
    required this.isEnemy,
    required this.onTimerStateChanged,
  });

  final GameParticipant player;
  final int index;
  final bool isEnemy;
  final Function(bool) onTimerStateChanged;

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
            if (isEnemy)
              ReorderableDragStartListener(
                index: index,
                child: const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.drag_handle, color: Colors.white38, size: 24),
                ),
              ),
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
              child: SummonerSpellCard(
                spell: player.spellOne,
                isInteractive: player.team == Team.enemy,
                onCooldownStateChanged: onTimerStateChanged,
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 54,
              height: 54,
              child: SummonerSpellCard(
                spell: player.spellTwo,
                isInteractive: player.team == Team.enemy,
                onCooldownStateChanged: onTimerStateChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
