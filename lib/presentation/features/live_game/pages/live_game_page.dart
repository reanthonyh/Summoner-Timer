import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';
import 'package:summoner_timer/presentation/features/live_game/bloc/live_game_bloc.dart';
import 'package:summoner_timer/presentation/features/live_game/bloc/live_game_event_state.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';
import 'package:summoner_timer/presentation/widgets/nexus_bottom_nav.dart';

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

final class _LiveGamePageContent extends StatefulWidget {
  const _LiveGamePageContent();

  @override
  State<_LiveGamePageContent> createState() => _LiveGamePageContentState();
}

class _LiveGamePageContentState extends State<_LiveGamePageContent> {
  int _currentIndex = 0; // TRACKER

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.adjust, color: NexusColors.primary, size: 32),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('COMBAT HUD', style: NexusTextStyles.header.copyWith(fontSize: 18)),
            const SizedBox(height: 2),
            Text(
              'SYSTEM_STATUS: ACTIVE // OPS_042',
              style: NexusTextStyles.caption.copyWith(color: NexusColors.textSecondary),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: NexusColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: NexusColors.cardBorder),
              ),
              child: IconButton(
                icon: const Icon(Icons.settings, color: NexusColors.primary),
                onPressed: () {},
                iconSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<LiveGameBloc, LiveGameState>(
        builder: (context, state) {
          if (state is LiveGameInitial || state is LiveGameLoading) {
            return const Center(
              child: CircularProgressIndicator(color: NexusColors.primary),
            );
          } else if (state is LiveGameLoaded) {
            final gameInfo = state.gameInformation;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...gameInfo.players.map(
                    (player) =>
                        _buildPlayerHUDRow(player.spellOne.name, player.spellTwo.name),
                  ),
                  // If real game info is available, there might be more or fewer UI blocks.
                  // For the sake of the mockup if players list is empty, let's show dummy rows.
                  if (gameInfo.players.isEmpty) ...[
                    _buildPlayerHUDRow('Flash', 'Teleport', role: 'TOP'),
                    _buildPlayerHUDRow('Flash', 'Ignite', role: 'MID'),
                    _buildPlayerHUDRow('Smite', 'Flash', role: 'JNG'),
                    _buildPlayerHUDRow('Flash', 'Heal', role: 'ADC'),
                    _buildPlayerHUDRow('Exhaust', 'Flash', role: 'SUP'),
                  ],

                  const SizedBox(height: 32),
                  // Global Modifiers UI at the bottom
                  _buildGlobalModifiers(),
                ],
              ),
            );
          } else if (state is LiveGameNotFound) {
            // Fallback for UI visualization
            return _buildMockupView();
          } else if (state is LiveGameError) {
            // Fallback for UI visualization on error too
            // So I can see the HUD even without backend.
            print('Error loading game: ${state.message}. Showing Mockup.');
            return _buildMockupView();
          }
          return const SizedBox.shrink();
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
          NexusBottomNavItem(icon: Icons.track_changes, label: 'Tracker'),
          NexusBottomNavItem(icon: Icons.analytics_outlined, label: 'Intel'),
          NexusBottomNavItem(icon: Icons.groups, label: 'History'),
          NexusBottomNavItem(icon: Icons.memory, label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildMockupView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlayerHUDRow('Flash', 'Teleport', role: 'TOP', cd1: '142'),
          const SizedBox(height: 16),
          _buildPlayerHUDRow('Flash', 'Ignite', role: 'MID'),
          const SizedBox(height: 16),
          _buildPlayerHUDRow('Smite', 'Flash', role: 'JNG', cd2: '12'),
          const SizedBox(height: 16),
          _buildPlayerHUDRow('Flash', 'Heal', role: 'ADC', cd1: '285', cd2: '112'),
          const SizedBox(height: 16),
          _buildPlayerHUDRow('Exhaust', 'Flash', role: 'SUP'),
          const SizedBox(height: 32),
          _buildGlobalModifiers(),
        ],
      ),
    );
  }

  Widget _buildPlayerHUDRow(
    String spell1Name,
    String spell2Name, {
    String role = 'TOP',
    String? cd1,
    String? cd2,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: NexusColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: NexusColors.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Avatar + Role
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: NexusColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.person, color: NexusColors.textSecondary),
                ),
                Positioned(
                  right: -4,
                  bottom: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: NexusColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      role,
                      style: NexusTextStyles.caption.copyWith(
                        color: NexusColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Spell 1
            _buildSpellBlock(spell1Name, cd: cd1),
            const SizedBox(width: 12),

            // Spell 2
            _buildSpellBlock(spell2Name, cd: cd2),
            const SizedBox(width: 16),

            // Modifiers toggles
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.directions_run,
                      size: 14,
                      color: NexusColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    _buildMiniSwitch(false),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.psychology,
                      size: 14,
                      color: NexusColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    _buildMiniSwitch(true),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpellBlock(String name, {String? cd}) {
    final isOnCd = cd != null;
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isOnCd
            ? NexusColors.primaryDark
            : NexusColors.textMuted.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: isOnCd ? Border.all(color: NexusColors.primary) : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fake icon
          Icon(
            Icons.flash_on,
            size: 40,
            color: isOnCd
                ? NexusColors.textPrimary.withValues(alpha: 0.2)
                : NexusColors.textPrimary,
          ),
          if (isOnCd) ...[
            // Slash line
            Transform.rotate(
              angle: -0.785, // -45 degrees
              child: Container(
                width: 100,
                height: 2,
                color: NexusColors.textPrimary.withValues(alpha: 0.2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cd, style: NexusTextStyles.title.copyWith(fontSize: 24)),
                Text(
                  name.toUpperCase(),
                  style: NexusTextStyles.caption.copyWith(
                    color: NexusColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMiniSwitch(bool value) {
    return Container(
      width: 28,
      height: 16,
      decoration: BoxDecoration(
        color: value ? NexusColors.textSecondary : NexusColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: NexusColors.textMuted),
      ),
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(2),
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: value ? NexusColors.cardBackground : NexusColors.textMuted,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildGlobalModifiers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'GLOBAL MODIFIERS',
              style: NexusTextStyles.label.copyWith(color: NexusColors.primaryDark),
            ),
            Text(
              'SYNCED TO MATCH TIME: 18:42',
              style: NexusTextStyles.label.copyWith(color: NexusColors.primaryDark),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildModifierToggle('IONIAN', 'BOOTS', Icons.directions_run, true),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildModifierToggle('COSMIC', 'INSIGHT', Icons.psychology, false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModifierToggle(String title1, String title2, IconData icon, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: NexusColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: active ? NexusColors.primary : NexusColors.cardBorder),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: active ? NexusColors.primary : NexusColors.textSecondary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: NexusTextStyles.caption.copyWith(
                    color: active ? NexusColors.textPrimary : NexusColors.textSecondary,
                  ),
                ),
                Text(
                  title2,
                  style: NexusTextStyles.label.copyWith(
                    color: active ? NexusColors.textPrimary : NexusColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          _buildMiniSwitch(active),
        ],
      ),
    );
  }
}
