part of 'game_page.dart';

final class _GameView extends StatefulWidget {
  const _GameView();

  @override
  State<_GameView> createState() => _GameViewState();
}

class _GameViewState extends State<_GameView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<GameBloc>().add(const GameEvent.loadGame());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<GameBloc>().add(const GameEvent.resumeTimers());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.game_live_title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status.isError) {
              return const _ErrorView();
            }

            if (state.status.isSuccess && state.gameInformation != null) {
              return _GameContent(
                gameInformation: state.gameInformation!,
                activeTimers: state.activeTimers,
              );
            }

            return const _NoGameView();
          },
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<GameBloc>().add(const GameEvent.gameView());
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 24),
            BlocSelector<GameBloc, GameState, String>(
              selector: (state) => state.message ?? intl.general_error,
              builder: (context, message) => Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 32),
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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videogame_asset_off_rounded,
              size: 64,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              intl.game_not_in_game,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              intl.profile_not_in_game,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
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
  const _GameContent({required this.gameInformation, required this.activeTimers});

  final GameInformation gameInformation;
  final Map<String, SpellTimer> activeTimers;

  @override
  State<_GameContent> createState() => _GameContentState();
}

class _GameContentState extends State<_GameContent> {
  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;

    final allyPlayers = widget.gameInformation.players
        .where((p) => p.team == Team.ally)
        .toList();
    final enemyPlayers = widget.gameInformation.players
        .where((p) => p.team == Team.enemy)
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        _TeamHeader(
          title: intl.game_enemy_team,
          color: Colors.redAccent,
          icon: Icons.security_rounded,
        ),
        ...enemyPlayers.map(
          (player) => _ParticipantRow(
            participant: player,
            activeTimers: widget.activeTimers,
            isEnemy: true,
          ),
        ),
        const SizedBox(height: 24),
        _TeamHeader(
          title: intl.game_ally_team,
          color: Colors.blueAccent,
          icon: Icons.shield_rounded,
        ),
        ...allyPlayers.map(
          (player) => _ParticipantRow(
            participant: player,
            activeTimers: widget.activeTimers,
            isEnemy: false,
          ),
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
  const _TeamHeader({
    required this.title,
    required this.color,
    required this.icon,
  });

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: theme.textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Divider(color: color.withValues(alpha: 0.3), thickness: 1),
          ),
        ],
      ),
    );
  }
}

class _ParticipantRow extends StatelessWidget {
  const _ParticipantRow({
    required this.participant,
    required this.activeTimers,
    required this.isEnemy,
  });

  final GameParticipant participant;
  final Map<String, SpellTimer> activeTimers;
  final bool isEnemy;

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timerKey1 = '${participant.riotId}_1';
    final timerKey2 = '${participant.riotId}_2';
    final timer1 = activeTimers[timerKey1];
    final timer2 = activeTimers[timerKey2];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        elevation: 0,
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Champion placeholder / ID
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
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
              const SizedBox(width: 12),
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
              const SizedBox(width: 8),
              if (isEnemy) ...[
                _SpellTimerBox(
                  spell: participant.spellOne,
                  remainingSeconds: timer1?.remainingSeconds,
                  onTap: () {
                    context.read<GameBloc>().add(
                      GameEvent.startSpellTimer(
                        participantId: participant.riotId,
                        spellSlot: 1,
                      ),
                    );
                  },
                  formatTime: _formatTime,
                ),
                const SizedBox(width: 8),
                _SpellTimerBox(
                  spell: participant.spellTwo,
                  remainingSeconds: timer2?.remainingSeconds,
                  onTap: () {
                    context.read<GameBloc>().add(
                      GameEvent.startSpellTimer(
                        participantId: participant.riotId,
                        spellSlot: 2,
                      ),
                    );
                  },
                  formatTime: _formatTime,
                ),
              ] else ...[
                _SpellStaticBox(spell: participant.spellOne),
                const SizedBox(width: 8),
                _SpellStaticBox(spell: participant.spellTwo),
              ],
            ],
          ),
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
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
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
    required this.remainingSeconds,
    required this.onTap,
    required this.formatTime,
  });

  final SummonerSpell spell;
  final int? remainingSeconds;
  final VoidCallback onTap;
  final String Function(int) formatTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTimer = remainingSeconds != null;
    const size = 52.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: hasTimer
                  ? Colors.redAccent
                  : theme.colorScheme.primary.withValues(alpha: 0.5),
              width: hasTimer ? 2 : 1,
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
                  color: hasTimer ? Colors.black.withValues(alpha: 0.6) : null,
                  colorBlendMode: hasTimer ? BlendMode.darken : null,
                ),
                if (hasTimer)
                  Text(
                    formatTime(remainingSeconds!),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                if (!hasTimer)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 4,
                      color: theme.colorScheme.primary.withValues(alpha: 0.5),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
