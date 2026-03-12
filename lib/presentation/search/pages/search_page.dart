import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/search/bloc/search_cubit.dart';
import 'package:summoner_timer/presentation/search/bloc/search_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final name = _nameController.text.trim();
    final tag = _tagController.text.trim();

    if (name.isNotEmpty && tag.isNotEmpty) {
      context.read<SearchCubit>().search(name, tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              const Center(
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.search, size: 36, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'TRACK YOUR LEGEND',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'IDENTIFY SUMMONER VIA RIOT PROTOCOL',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 1.5),
              ),
              const SizedBox(height: 48),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF222222),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'RIOT ID',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Summoner Name',
                        hintStyle: const TextStyle(color: Colors.white30),
                        prefixIcon: const Icon(Icons.person, color: Colors.white54),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'TAGLINE',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _tagController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'HEX',
                        hintStyle: const TextStyle(color: Colors.white30),
                        prefixIcon: const Icon(Icons.tag, color: Colors.white54),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.rocket_launch, color: Colors.white),
                        label: const Text(
                          'INITIATE SEARCH',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _onSearch,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'RECENT/SAVED',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 2),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      loaded: (accounts) {
                        if (accounts.isEmpty) {
                          return const Center(
                            child: Text(
                              'No saved accounts',
                              style: TextStyle(color: Colors.white54),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: accounts.length,
                          itemBuilder: (context, index) {
                            final account = accounts[index];
                            return _buildAccountTile(context, account);
                          },
                        );
                      },
                      error: (message) => Center(
                        child: Text(message, style: const TextStyle(color: Colors.red)),
                      ),
                      orElse: () {
                        // fallback maybe if it throws back an error
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTile(BuildContext context, Account account) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[800],
          backgroundImage: account.profileIconId != null
              ? NetworkImage(
                  'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/${account.profileIconId}.png',
                )
              : null,
          child: account.profileIconId == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        title: Text(
          account.gameName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '#${account.tagLine}',
          style: const TextStyle(color: Colors.white54),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: () {
          context.read<SearchCubit>().selectSavedAccount(account);
        },
      ),
    );
  }
}
