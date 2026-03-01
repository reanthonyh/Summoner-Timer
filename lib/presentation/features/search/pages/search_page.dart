import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'package:summoner_timer/presentation/features/search/bloc/search_bloc.dart';
import 'package:summoner_timer/presentation/features/search/bloc/search_event_state.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';
import 'package:summoner_timer/presentation/widgets/nexus_text_field.dart';
import 'package:summoner_timer/presentation/widgets/nexus_button.dart';
import 'package:summoner_timer/presentation/widgets/nexus_bottom_nav.dart';

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
  int _currentIndex = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _onSearchPressed(BuildContext context) {
    if (_nameController.text.isNotEmpty && _tagController.text.isNotEmpty) {
      // Unfocus keyboard
      FocusScope.of(context).unfocus();
      context.read<SearchBloc>().add(
        SearchSummonerEvent(
          name: _nameController.text,
          tag: _tagController.text.replaceAll('#', ''), // strip hashtag if user enters it
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: NexusColors.textPrimary),
          onPressed: () {}, // Handle back
        ),
        title: Text(
          'NEXUS PROTOCOL',
          style: NexusTextStyles.header.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: NexusColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchSuccess) {
            // For now, based on mockup, redirecting right away or show success?
            // In the real flow, it would go to profile or live game.
            // Let's assume hitting search -> gets data -> pushes profile page
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Found ${state.account.gameName}')));
          } else if (state is SearchError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error: ${state.message}',
                  style: TextStyle(color: NexusColors.textPrimary),
                ),
                backgroundColor: NexusColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is SearchLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Icon
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: NexusColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: NexusColors.cardBorder),
                  ),
                  child: const Icon(Icons.public, color: NexusColors.primary, size: 40),
                ),
                const SizedBox(height: 24),

                // Titles
                Text(
                  'TRACK YOUR LEGEND',
                  style: NexusTextStyles.header.copyWith(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'IDENTIFY SUMMONER VIA RIOT PROTOCOL',
                  style: NexusTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Form Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: NexusColors.cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: NexusColors.cardBorder.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NexusTextField(
                        label: 'RIOT ID',
                        hintText: 'Summoner Name',
                        controller: _nameController,
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                      NexusTextField(
                        label: 'TAGLINE',
                        hintText: 'HEX',
                        controller: _tagController,
                        prefixIcon: Icons.tag,
                      ),
                      const SizedBox(height: 32),
                      NexusButton(
                        text: 'INITIATE SEARCH',
                        suffixIcon: Icons.rocket_launch,
                        isLoading: isLoading,
                        onPressed: () => _onSearchPressed(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
                // Server Status Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatusDot(NexusColors.primary, 'EUW'),
                    const SizedBox(width: 24),
                    _buildStatusDot(NexusColors.success, 'ONLINE'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NexusBottomNav(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          NexusBottomNavItem(icon: Icons.search, label: 'Search'),
          NexusBottomNavItem(icon: Icons.history, label: 'History'),
          NexusBottomNavItem(icon: Icons.emoji_events_outlined, label: 'Global'),
          NexusBottomNavItem(icon: Icons.person_outline, label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildStatusDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.5),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: NexusTextStyles.label.copyWith(color: NexusColors.textSecondary),
        ),
      ],
    );
  }
}
