import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'package:summoner_timer/presentation/features/live_game/bloc/live_game_bloc.dart';
import 'package:summoner_timer/presentation/features/live_game/bloc/live_game_event_state.dart';
import 'package:summoner_timer/presentation/features/search/pages/search_page.dart';

final class LiveGamePage extends StatelessWidget {
  const LiveGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LiveGameBloc(getCurrentGameUseCase: getIt<GetCurrentGameUseCase>())
            ..add(const LoadLiveGameEvent()),
      child: const _LiveGamePageContent(),
    );
  }
}

final class _LiveGamePageContent extends StatelessWidget {
  const _LiveGamePageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Game'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => const SearchPage()));
          },
        ),
      ),
      body: BlocBuilder<LiveGameBloc, LiveGameState>(
        builder: (context, state) {
          if (state is LiveGameInitial || state is LiveGameLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LiveGameLoaded) {
            final gameInfo = state.gameInformation;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Match ID: ${gameInfo.matchId ?? "N/A"}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Players (${gameInfo.players.length}):',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: gameInfo.players.length,
                      itemBuilder: (context, index) {
                        final player = gameInfo.players[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PUUID: ${player.puuid ?? "N/A"}'),
                                Text('Is Bot: ${player.isBot}'),
                                Text(
                                  'Spell 1: ${player.spellOne.name} (${player.spellOne.id}) - Cooldown: ${player.spellOne.cooldownSeconds}s',
                                ),
                                Text(
                                  'Spell 2: ${player.spellTwo.name} (${player.spellTwo.id}) - Cooldown: ${player.spellTwo.cooldownSeconds}s',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LiveGameNotFound) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No live game found'),
                  SizedBox(height: 16),
                  Text('The summoner is not currently in a game'),
                ],
              ),
            );
          } else if (state is LiveGameError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LiveGameBloc>().add(const LoadLiveGameEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
