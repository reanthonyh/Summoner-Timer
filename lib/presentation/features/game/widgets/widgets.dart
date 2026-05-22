part of '../page/game_page.dart';

final class _GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _GameAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final title = AppLocalizations.of(context)!.game_live_title;

    return AppBar(
      title: Text(title),
      centerTitle: true,
      foregroundColor: colorScheme.onPrimaryContainer,
      backgroundColor: colorScheme.primaryContainer,
    );
  }
}

final class _GameBody extends StatelessWidget {
  const _GameBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<GameBloc, GameState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.gameInformation != current.gameInformation,
        builder: (context, state) {
          if (state.status.isLoading) {
            return const _GameLoadingView();
          }

          if (state.status.isError) {
            return const _ErrorView();
          }

          if (state.status.isSuccess && state.gameInformation != null) {
            return _GameContent(gameInformation: state.gameInformation!);
          }

          return const _NoGameView();
        },
        listener: (context, state) {},
      ),
    );
  }
}

final class _GameLoadingView extends StatelessWidget {
  const _GameLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
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
  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;

    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (previous, current) =>
          previous.enemyPlayerOrder != current.enemyPlayerOrder,
      builder: (context, state) {
        // Resolve player ordering
        final enemyIds = state.enemyPlayerOrder.isNotEmpty
            ? state.enemyPlayerOrder
            : widget.gameInformation.players
                  .where((p) => p.team == Team.enemy)
                  .map((p) => p.riotId)
                  .toList();
        final enemyPlayers = enemyIds
            .map((id) => widget.gameInformation.players.firstWhere((p) => p.riotId == id))
            .toList();
        final allyPlayers = widget.gameInformation.players
            .where((p) => p.team == Team.ally)
            .toList();

        final enemySection = _EnemySection(intl: intl, enemyPlayers: enemyPlayers);
        final allySection = _AllySection(intl: intl, allyPlayers: allyPlayers);

        return OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.landscape
              ? _LandscapeView(intl: intl, enemyPlayers: enemyPlayers, allyPlayers: allyPlayers)
              : _PortraitView(enemySection: enemySection, allySection: allySection),
        );
      },
    );
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }
}

// Section widget for enemy team
class _EnemySection extends StatelessWidget {
  const _EnemySection({required this.intl, required this.enemyPlayers});

  final AppLocalizations intl;
  final List<GameParticipant> enemyPlayers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TeamHeader(
          title: intl.game_enemy_team,
          color: Colors.redAccent,
          icon: Icons.security_rounded,
        ),
        ColoredBox(
          color: Colors.red.withAlpha(25),
          child: SizedBox(
            height: enemyPlayers.length * 70.0,
            child: ReorderableListView.builder(
              itemCount: enemyPlayers.length,
              onReorderItem: (oldIndex, newIndex) {
                context.read<GameBloc>().add(
                  GameEvent.reorderEnemyPlayers(oldIndex: oldIndex, newIndex: newIndex),
                );
              },
              itemBuilder: (context, index) {
                final player = enemyPlayers[index];
                return _EnemyParticipantRow(
                  key: ValueKey(player.riotId),
                  participant: player,
                  index: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Section widget for ally team
class _AllySection extends StatelessWidget {
  const _AllySection({required this.intl, required this.allyPlayers});

  final AppLocalizations intl;
  final List<GameParticipant> allyPlayers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        _TeamHeader(
          title: intl.game_ally_team,
          color: Colors.blueAccent,
          icon: Icons.shield_rounded,
        ),
        ...allyPlayers.map((p) => _AllyParticipantRow(participant: p)),
      ],
    );
  }
}

class _PortraitView extends StatelessWidget {
  const _PortraitView({required this.enemySection, required this.allySection});

  final Widget enemySection;
  final Widget allySection;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: AppSpacing.md, children: [enemySection, allySection]);
  }
}

class _LandscapeView extends StatelessWidget {
  const _LandscapeView({
    required this.intl,
    required this.enemyPlayers,
    required this.allyPlayers,
  });

  final AppLocalizations intl;
  final List<GameParticipant> enemyPlayers;
  final List<GameParticipant> allyPlayers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TeamHeader(
                title: intl.game_enemy_team,
                color: Colors.redAccent,
                icon: Icons.security_rounded,
              ),
              Expanded(
                child: ColoredBox(
                  color: Colors.red.withAlpha(25),
                  child: ReorderableListView.builder(
                    itemCount: enemyPlayers.length,
                    onReorderItem: (oldIndex, newIndex) {
                      context.read<GameBloc>().add(
                        GameEvent.reorderEnemyPlayers(
                          oldIndex: oldIndex,
                          newIndex: newIndex,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      final player = enemyPlayers[index];
                      return _EnemyParticipantRow(
                        key: ValueKey(player.riotId),
                        participant: player,
                        index: index,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TeamHeader(
                title: intl.game_ally_team,
                color: Colors.blueAccent,
                icon: Icons.shield_rounded,
              ),
              Expanded(
                child: ListView(
                  children: allyPlayers
                      .map((p) => _AllyParticipantRow(participant: p))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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

class _EnemyParticipantRow extends StatelessWidget {
  const _EnemyParticipantRow({super.key, required this.participant, required this.index});

  final GameParticipant participant;
  final int index;

  @override
  Widget build(BuildContext context) {
    final timerKey1 = '${participant.riotId}_1';
    final timerKey2 = '${participant.riotId}_2';

    return BlocSelector<GameBloc, GameState, (SpellTimer?, SpellTimer?)>(
      bloc: context.read<GameBloc>(),
      selector: (state) => (state.activeTimers[timerKey1], state.activeTimers[timerKey2]),
      builder: (context, timers) {
        final (spellOneTimer, spellTwoTimer) = timers;
        return _EnemyParticipantRowContent(
          participant: participant,
          index: index,
          spellOneTimer: spellOneTimer,
          spellTwoTimer: spellTwoTimer,
        );
      },
    );
  }
}

class _EnemyParticipantRowContent extends StatelessWidget {
  const _EnemyParticipantRowContent({
    required this.participant,
    required this.index,
    required this.spellOneTimer,
    required this.spellTwoTimer,
  });

  final GameParticipant participant;
  final int index;
  final SpellTimer? spellOneTimer;
  final SpellTimer? spellTwoTimer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: AppSpacing.sm,
      child: Row(
        spacing: 6,
        children: [
          ReorderableDragStartListener(
            index: index,
            child: Icon(Icons.drag_indicator, color: theme.colorScheme.onSurfaceVariant),
          ),
          Expanded(
            child: Text(
              participant.riotId,
              style: theme.textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const VerticalDivider(),
          _SpellTimerBox(
            spell: participant.spellOne,
            participantId: participant.riotId,
            spellSlot: 1,
            timer: spellOneTimer,
          ),
          _SpellTimerBox(
            spell: participant.spellTwo,
            participantId: participant.riotId,
            spellSlot: 2,
            timer: spellTwoTimer,
          ),
        ],
      ),
    );
  }
}


class _AllyParticipantRow extends StatelessWidget {
  const _AllyParticipantRow({required this.participant});

  final GameParticipant participant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: AppSpacing.xs,
      child: Row(
        spacing: 5,
        children: [
          Expanded(
            child: Text(
              participant.riotId,
              style: theme.textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const VerticalDivider(),
          _SpellStaticBox(spell: participant.spellOne),
          _SpellStaticBox(spell: participant.spellTwo),
        ],
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
    const size = 40.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
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
    required this.timer,
  });

  final SummonerSpell spell;
  final String participantId;
  final int spellSlot;
  final SpellTimer? timer;

  String _formatTime(int seconds) {
    return seconds.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRunning = timer?.isRunning ?? false;
    final remainingSeconds = timer?.remainingSeconds ?? 0;
    const size = 50.0;

    return InkWell(
      onTap: () {
        context.read<GameBloc>().add(
          GameEvent.startSpellTimer(participantId: participantId, spellSlot: spellSlot),
        );
      },
      onLongPress: () {
        context.read<GameBloc>().add(
          GameEvent.prepareSpellTimer(participantId: participantId, spellSlot: spellSlot),
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
                color: isRunning ? Colors.black.withValues(alpha: 0.5) : null,
                colorBlendMode: isRunning ? BlendMode.darken : null,
              ),
              if (isRunning)
                Text(
                  _formatTime(remainingSeconds),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
