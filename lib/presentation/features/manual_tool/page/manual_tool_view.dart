part of 'manual_tool_page.dart';

const _laneNames = ['TopLane', 'JungleLane', 'MidLane', 'BotLane', 'Support'];

final class _ManualToolView extends StatelessWidget {
  const _ManualToolView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManualToolCubit, ManualToolState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manual Tool'),
            centerTitle: true,
            actions: [
              if (state.mode == ManualToolMode.action)
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => context.read<ManualToolCubit>().reset(),
                  tooltip: 'Reset',
                ),
            ],
          ),
          body: state.mode == ManualToolMode.setup
              ? _SetupModeView(state: state)
              : _ActionModeView(state: state),
        );
      },
    );
  }
}

final class _SetupModeView extends StatelessWidget {
  const _SetupModeView({required this.state});

  final ManualToolState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManualToolCubit>();
    final canStart = cubit.canStartActionMode;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Configure Your Enemies',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Select summoner spells for each enemy',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ...state.enemies.asMap().entries.map((entry) {
            final index = entry.key;
            final enemy = entry.value;
            return _EnemySetupCard(
              laneName: _laneNames[index],
              enemy: enemy,
              availableSpells: state.availableSpells,
              onSpellOneChanged: (spell) => cubit.updateEnemySpellOne(index, spell),
              onSpellTwoChanged: (spell) => cubit.updateEnemySpellTwo(index, spell),
            );
          }),
          const SizedBox(height: 24),
          if (!canStart)
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Please select both summoner spells for all participants',
                style: TextStyle(color: Colors.orange),
                textAlign: TextAlign.center,
              ),
            ),
          FilledButton.icon(
            onPressed: canStart ? () => cubit.startActionMode() : null,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Tracking'),
          ),
        ],
      ),
    );
  }
}

final class _EnemySetupCard extends StatelessWidget {
  const _EnemySetupCard({
    required this.laneName,
    required this.enemy,
    required this.availableSpells,
    required this.onSpellOneChanged,
    required this.onSpellTwoChanged,
  });

  final String laneName;
  final ManualEnemy enemy;
  final List<SummonerSpell> availableSpells;
  final ValueChanged<SummonerSpell> onSpellOneChanged;
  final ValueChanged<SummonerSpell> onSpellTwoChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(laneName, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SpellButton(
                    label: 'Spell 1',
                    spell: enemy.spellOne,
                    availableSpells: availableSpells,
                    onSpellSelected: onSpellOneChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SpellButton(
                    label: 'Spell 2',
                    spell: enemy.spellTwo,
                    availableSpells: availableSpells,
                    onSpellSelected: onSpellTwoChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class _SpellButton extends StatelessWidget {
  const _SpellButton({
    required this.label,
    required this.spell,
    required this.availableSpells,
    required this.onSpellSelected,
  });

  final String label;
  final SummonerSpell spell;
  final List<SummonerSpell> availableSpells;
  final ValueChanged<SummonerSpell> onSpellSelected;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _showSpellPicker(context),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (spell.id.isNotEmpty) ...[
            CachedNetworkImage(
              imageUrl: spell.imageUrl,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                width: 24,
                height: 24,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 8),
          ],
          Text(spell.id.isEmpty ? label : spell.name),
        ],
      ),
    );
  }

  void _showSpellPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _SpellPickerModal(
        spells: availableSpells,
        onSpellSelected: (selectedSpell) {
          onSpellSelected(selectedSpell);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

final class _SpellPickerModal extends StatelessWidget {
  const _SpellPickerModal({required this.spells, required this.onSpellSelected});

  final List<SummonerSpell> spells;
  final ValueChanged<SummonerSpell> onSpellSelected;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Select Summoner Spell',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: spells.length,
                  itemBuilder: (context, index) {
                    final spell = spells[index];
                    return InkWell(
                      onTap: () => onSpellSelected(spell),
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: spell.imageUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.error, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            spell.name,
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _ActionModeView extends StatelessWidget {
  const _ActionModeView({required this.state});

  final ManualToolState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Tap on spell to start cooldown', style: TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.enemies.length,
            itemBuilder: (context, index) {
              final enemy = state.enemies[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _ManualEnemyActionCard(laneName: _laneNames[index], enemy: enemy),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: OutlinedButton.icon(
            onPressed: () => context.read<ManualToolCubit>().backToSetup(),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back to Setup'),
          ),
        ),
      ],
    );
  }
}

final class _ManualEnemyActionCard extends StatelessWidget {
  const _ManualEnemyActionCard({required this.laneName, required this.enemy});

  final String laneName;
  final ManualEnemy enemy;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              laneName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(width: 16),
            SummonerSpellBox(spell: enemy.spellOne),
            const SizedBox(width: 8),
            SummonerSpellBox(spell: enemy.spellTwo),
          ],
        ),
      ),
    );
  }
}
