part of '../page/game_page.dart';

final class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final intl = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, size: 64, color: theme.colorScheme.error),
            BlocSelector<GameBloc, GameState, String>(
              selector: (state) => state.message ?? intl.general_error,
              builder: (context, message) => Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            ),
            FilledButton.icon(
              onPressed: () =>
                  context.read<GameBloc>().add(const GameEvent.retryLoadGame()),
              icon: const Icon(Icons.refresh_rounded),
              label: Text(intl.game_retry),
            ),
          ],
        ),
      ),
    );
  }
}

final class _NoGameView extends StatelessWidget {
  const _NoGameView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final intl = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: AppSpacing.lg,
        child: Column(
          spacing: 18,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videogame_asset_off_rounded,
              size: 64,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            Text(
              intl.game_not_in_game,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              intl.profile_not_in_game,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            FilledButton.icon(
              onPressed: () =>
                  context.read<GameBloc>().add(const GameEvent.retryLoadGame()),
              icon: const Icon(Icons.refresh_rounded),
              label: Text(intl.game_retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameContent extends StatefulWidget {
  const _GameContent({required this.gameInformation});

  final GameInformation gameInformation;

  @override
  State<_GameContent> createState() => _GameContentState();
}

class _GameContentState extends State<_GameContent> {
  late List<GameParticipant> _enemyPlayers;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _enemyPlayers = widget.gameInformation.players
        .where((p) => p.team == Team.enemy)
        .toList();
  }

  @override
  void didUpdateWidget(covariant _GameContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gameInformation.matchId != widget.gameInformation.matchId) {
      _enemyPlayers = widget.gameInformation.players
          .where((p) => p.team == Team.enemy)
          .toList();
    }
  }

  void _movePlayer(int index, int direction) {
    setState(() {
      final newIndex = index + direction;
      if (newIndex >= 0 && newIndex < _enemyPlayers.length) {
        final item = _enemyPlayers.removeAt(index);
        _enemyPlayers.insert(newIndex, item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;

    final allyPlayers = widget.gameInformation.players
        .where((p) => p.team == Team.ally)
        .toList();

    return ListView(
      padding: AppSpacing.lg,
      children: [
        _TeamHeader(
          title: intl.game_enemy_team,
          color: Colors.redAccent,
          icon: Icons.security_rounded,
        ),
        _DragHintText(),
        ...List.generate(_enemyPlayers.length, (index) {
          final player = _enemyPlayers[index];
          return _ParticipantRow(
            key: ValueKey('${player.riotId}_$index'),
            participant: player,
            isEnemy: true,
            index: index,
            canMoveUp: index > 0,
            canMoveDown: index < _enemyPlayers.length - 1,
            onMoveUp: () => _movePlayer(index, -1),
            onMoveDown: () => _movePlayer(index, 1),
          );
        }),
        const SizedBox(height: 24),
        _TeamHeader(
          title: intl.game_ally_team,
          color: Colors.blueAccent,
          icon: Icons.shield_rounded,
        ),
        ...allyPlayers.map(
          (player) => _ParticipantRow(participant: player, isEnemy: false),
        ),
      ],
    );
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }
}

class _TeamHeader extends StatelessWidget {
  const _TeamHeader({required this.title, required this.color, required this.icon});

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: AppSpacing.md,
      child: Row(
        spacing: 12,
        children: [
          Icon(icon, color: color, size: 20),
          Text(title.toUpperCase(), style: theme.textTheme.titleMedium),
          Expanded(child: Divider(color: color.withValues(alpha: 0.3), thickness: 1)),
        ],
      ),
    );
  }
}

class _DragHintText extends StatelessWidget {
  const _DragHintText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        'Use arrow buttons to reorder by lane',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class _ParticipantRow extends StatelessWidget {
  const _ParticipantRow({
    super.key,
    required this.participant,
    required this.isEnemy,
    this.index,
    this.canMoveUp = false,
    this.canMoveDown = false,
    this.onMoveUp,
    this.onMoveDown,
  });

  final GameParticipant participant;
  final bool isEnemy;
  final int? index;
  final bool canMoveUp;
  final bool canMoveDown;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          spacing: 4,
          children: [
            // Champion placeholder / ID
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  participant.championId.toString(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            const VerticalDivider(thickness: 1, width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant.riotId,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (participant.isBot)
                    Text(
                      'BOT',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
            const VerticalDivider(),
            if (isEnemy) ...[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: canMoveUp
                        ? IconButton(
                            icon: const Icon(Icons.keyboard_arrow_up, size: 16),
                            onPressed: onMoveUp,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: canMoveDown
                        ? IconButton(
                            icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                            onPressed: onMoveDown,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        : null,
                  ),
                ],
              ),
              const SizedBox(width: 4),
              _SpellTimerBox(
                spell: participant.spellOne,
                participantId: participant.riotId,
                spellSlot: 1,
              ),
              const SizedBox(width: 4),
              _SpellTimerBox(
                spell: participant.spellTwo,
                participantId: participant.riotId,
                spellSlot: 2,
              ),
            ] else ...[
              _SpellStaticBox(spell: participant.spellOne),
              const SizedBox(width: 8),
              _SpellStaticBox(spell: participant.spellTwo),
            ],
          ],
        ),
      ),
    );
  }
}

class _SpellStaticBox extends StatelessWidget {
  const _SpellStaticBox({required this.spell});

  final SummonerSpell spell;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    const size = 38.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: CachedNetworkImage(
          imageUrl: spell.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(color: Colors.grey[900]),
        ),
      ),
    );
  }
}

class _SpellTimerBox extends StatelessWidget {
  const _SpellTimerBox({
    required this.spell,
    required this.participantId,
    required this.spellSlot,
  });

  final SummonerSpell spell;
  final String participantId;
  final int spellSlot;

  String _formatTime(int seconds) {
    return seconds.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timerKey = '${participantId}_$spellSlot';

    return BlocSelector<GameBloc, GameState, SpellTimer?>(
      selector: (state) => state.activeTimers[timerKey],
      builder: (context, timer) {
        final isRunning = timer?.isRunning ?? false;
        final remainingSeconds = timer?.remainingSeconds ?? 0;
        const size = 44.0;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<GameBloc>().add(
                GameEvent.startSpellTimer(
                  participantId: participantId,
                  spellSlot: spellSlot,
                ),
              );
            },
            onLongPress: () {
              context.read<GameBloc>().add(
                GameEvent.prepareSpellTimer(
                  participantId: participantId,
                  spellSlot: spellSlot,
                ),
              );
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isRunning
                      ? Colors.redAccent
                      : theme.colorScheme.primary.withValues(alpha: 0.5),
                  width: isRunning ? 2 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: spell.imageUrl,
                      fit: BoxFit.cover,
                      color: isRunning ? Colors.black.withValues(alpha: 0.6) : null,
                      colorBlendMode: isRunning ? BlendMode.darken : null,
                    ),
                    if (isRunning)
                      Text(
                        _formatTime(remainingSeconds),
                        style: theme.textTheme.labelMedium,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
