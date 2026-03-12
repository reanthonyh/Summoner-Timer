import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/game/bloc/game_cubit.dart';
import 'package:summoner_timer/presentation/game/pages/game_page.dart';
import 'package:summoner_timer/presentation/profile/bloc/profile_cubit.dart';
import 'package:summoner_timer/presentation/profile/bloc/profile_state.dart';

import 'package:summoner_timer/core/di/injection_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        title: const Text('SUMMONER PROFILE'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.read<ProfileCubit>().logout();
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text(
                'No account selected.\nPlease return to Search.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (account) => _buildProfile(context, account),
            error: (message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfile(BuildContext context, Account account) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.redAccent, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[800],
              backgroundImage: account.profileIconId != null
                  ? NetworkImage(
                      'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/${account.profileIconId}.png',
                    )
                  : null,
              child: account.profileIconId == null
                  ? const Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            account.gameName.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            '#${account.tagLine} • ${account.region.name.toUpperCase()}',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF222222),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                const Text(
                  'CURRENT MATCH',
                  style: TextStyle(
                    color: Colors.white54,
                    letterSpacing: 1.5,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.radar, color: Colors.white),
                  label: const Text('TRACK LIVE GAME'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => GameCubit(getCurrentGameUseCase: getIt()),
                          child: const GamePage(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
