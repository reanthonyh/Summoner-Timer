import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'package:summoner_timer/presentation/features/live_game/pages/live_game_page.dart';
import 'package:summoner_timer/presentation/features/search/bloc/search_bloc.dart';
import 'package:summoner_timer/presentation/features/search/bloc/search_event_state.dart';

final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(getAccountUseCase: getIt<GetAccountUseCase>()),
      child: const _SearchPageContent(),
    );
  }
}

class _SearchPageContent extends StatefulWidget {
  const _SearchPageContent();

  @override
  State<_SearchPageContent> createState() => _SearchPageContentState();
}

final class _SearchPageContentState extends State<_SearchPageContent> {
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Summoner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Summoner Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tagController,
              decoration: const InputDecoration(
                labelText: 'Tag (e.g., 05120)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _tagController.text.isNotEmpty) {
                  context.read<SearchBloc>().add(
                    SearchSummonerEvent(
                      name: _nameController.text,
                      tag: _tagController.text,
                    ),
                  );
                }
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 24),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Text('Enter a summoner name and tag to search');
                } else if (state is SearchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is SearchSuccess) {
                  return Column(
                    children: [
                      Text(
                        'Account Found:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text('PUUID: ${state.account.puuid}'),
                      Text('Game Name: ${state.account.gameName}'),
                      Text('Tag: ${state.account.tagLine}'),
                      Text('Region: ${state.account.region.code}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).push(MaterialPageRoute(builder: (_) => const LiveGamePage()));
                        },
                        child: const Text('Go to Live Game'),
                      ),
                    ],
                  );
                } else if (state is SearchError) {
                  return Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
