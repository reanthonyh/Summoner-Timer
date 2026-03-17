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
    final intl = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status.isError) {
              return _ErrorView();
            }

            if (state.status.isSuccess && state.gameInformation != null) {
              return _GameContent(
                gameInformation: state.gameInformation!,
                activeTimers: state.activeTimers,
              );
            }

            return _NoGameView(
              message: intl.game_not_in_game,
              onRetry: () =>
                  context.read<GameBloc>().add(const GameEvent.retryLoadGame()),
            );
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
    final intl = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<GameBloc, GameState, String>(
            selector: (state) => state.message ?? intl.general_error,
            builder: (context, message) => Text(message),
          ),

          ElevatedButton(
            onPressed: () =>
                context.read<GameBloc>().add(const GameEvent.retryLoadGame()),
            child: Text(intl.game_retry),
          ),
        ],
      ),
    );
  }
}

class _NoGameView extends StatelessWidget {
  const _NoGameView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(onPressed: onRetry, child: Text(intl.game_retry)),
        ],
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

    return SingleChildScrollView(
      child: Column(
        spacing: 12,

        mainAxisAlignment: .center,
        crossAxisAlignment: .start,

        children: [
          Padding(
            padding: AppSpacing.md,
            child: Text(
              intl.game_enemy_team,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...enemyPlayers.map(
            (player) => _ParticipantRow(
              participant: player,
              activeTimers: widget.activeTimers,
              isEnemy: true,
            ),
          ),

          Padding(
            padding: AppSpacing.md,
            child: Text(
              intl.game_ally_team,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...allyPlayers.map(
            (player) => _ParticipantRow(
              participant: player,
              activeTimers: widget.activeTimers,
              isEnemy: false,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
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
    final timerKey1 = '${participant.riotId}_1';
    final timerKey2 = '${participant.riotId}_2';
    final timer1 = activeTimers[timerKey1];
    final timer2 = activeTimers[timerKey2];

    return Padding(
      padding: AppSpacing.lg,
      child: Row(
        spacing: 18,

        children: [
          Expanded(child: Text(participant.riotId)),
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
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Icon(Icons.person, size: 24),
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Icon(Icons.person, size: 24),
            ),
          ],
        ],
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
    final hasTimer = remainingSeconds != null;
    const size = 48.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: hasTimer ? Colors.red : Colors.blue, width: 2),
          color: hasTimer ? Colors.red.withValues(alpha: 0.2) : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(imageUrl: spell.spriteUrl, fit: .cover),
            if (hasTimer)
              Positioned(
                bottom: 2,
                child: Text(
                  formatTime(remainingSeconds!),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
