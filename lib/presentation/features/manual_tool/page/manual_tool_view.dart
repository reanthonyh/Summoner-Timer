part of 'manual_tool_page.dart';

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
              enemyNumber: index + 1,
              enemy: enemy,
              availableSpells: state.availableSpells,
              onNameChanged: (name) =>
                  context.read<ManualToolCubit>().updateEnemyName(index, name),
              onSpellOneChanged: (spell) =>
                  context.read<ManualToolCubit>().updateEnemySpellOne(index, spell),
              onSpellTwoChanged: (spell) =>
                  context.read<ManualToolCubit>().updateEnemySpellTwo(index, spell),
            );
          }),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.read<ManualToolCubit>().startActionMode(),
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
    required this.enemyNumber,
    required this.enemy,
    required this.availableSpells,
    required this.onNameChanged,
    required this.onSpellOneChanged,
    required this.onSpellTwoChanged,
  });

  final int enemyNumber;
  final ManualEnemy enemy;
  final List<SummonerSpell> availableSpells;
  final ValueChanged<String> onNameChanged;
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
            Text(
              'Enemy $enemyNumber',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Champion Name',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: onNameChanged,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SpellDropdown(
                    label: 'Spell 1',
                    value: enemy.spellOne,
                    spells: availableSpells,
                    onChanged: onSpellOneChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SpellDropdown(
                    label: 'Spell 2',
                    value: enemy.spellTwo,
                    spells: availableSpells,
                    onChanged: onSpellTwoChanged,
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

final class _SpellDropdown extends StatelessWidget {
  const _SpellDropdown({
    required this.label,
    required this.value,
    required this.spells,
    required this.onChanged,
  });

  final String label;
  final SummonerSpell value;
  final List<SummonerSpell> spells;
  final ValueChanged<SummonerSpell> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SummonerSpell>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      initialValue: value.id.isEmpty ? null : value,
      items: spells.map((spell) {
        return DropdownMenuItem(
          value: spell,
          child: Text(spell.name, overflow: TextOverflow.ellipsis),
        );
      }).toList(),
      onChanged: (spell) {
        if (spell != null) onChanged(spell);
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
                child: _ManualEnemyActionCard(enemy: enemy),
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
  const _ManualEnemyActionCard({required this.enemy});

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
              enemy.name.isEmpty ? 'Enemy' : enemy.name,
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
