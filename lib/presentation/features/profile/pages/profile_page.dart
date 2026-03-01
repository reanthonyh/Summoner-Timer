import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';
import 'package:summoner_timer/presentation/widgets/nexus_bottom_nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3; // PROFILE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: NexusColors.textPrimary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'SUMMONER PROFILE',
          style: NexusTextStyles.header.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.tune,
              color: NexusColors.textPrimary,
            ), // filter/settings icon equivalent
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            // Avatar
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: NexusColors.primary, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: NexusColors.primary.withValues(alpha: 0.5),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                    // A placeholder icon since we lack the actual image
                    color: NexusColors.cardBackground,
                  ),
                  child: const Center(
                    child: Icon(Icons.person, size: 60, color: NexusColors.textSecondary),
                  ),
                ),
                Positioned(
                  bottom: -16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: NexusColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: NexusColors.background.withValues(alpha: 0.8),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'LVL',
                          style: NexusTextStyles.caption.copyWith(
                            color: NexusColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '564',
                          style: NexusTextStyles.label.copyWith(
                            color: NexusColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Name & Region
            Text('HIDE ON BUSH', style: NexusTextStyles.header.copyWith(fontSize: 24)),
            const SizedBox(height: 4),
            Text('REGION: SOUTH KOREA', style: NexusTextStyles.label),

            const SizedBox(height: 32),

            // Ranked Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: NexusColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: NexusColors.cardBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RANKED SOLO',
                          style: NexusTextStyles.label.copyWith(
                            color: NexusColors.primaryDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'DIAMOND I',
                          style: NexusTextStyles.title.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              '75 LP',
                              style: NexusTextStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' / 158W 142L',
                              style: NexusTextStyles.body.copyWith(
                                color: NexusColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Rank icon placeholder
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: NexusColors.primaryDark.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.diamond,
                      color: Colors.blueAccent,
                      size: 40,
                    ), // approximation
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Stats Row
            Row(
              children: [
                _buildStatCard('WIN RATE', '54.2%', highlight: true),
                const SizedBox(width: 12),
                _buildStatCard('KDA', '3.8:1'),
                const SizedBox(width: 12),
                _buildStatCard('AVG. CS', '8.4'),
              ],
            ),

            const SizedBox(height: 32),

            // Recent Matches Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RECENT MATCHES',
                  style: NexusTextStyles.label.copyWith(color: NexusColors.textSecondary),
                ),
                const Icon(Icons.filter_list, color: NexusColors.textSecondary, size: 20),
              ],
            ),

            const SizedBox(height: 16),

            // Match History List
            _buildMatchCard(
              isWin: true,
              type: 'RANKED SOLO • 28M',
              kda: '12 / 2 / 8',
              kdaRatio: '10.0 KDA',
            ),
            const SizedBox(height: 12),
            _buildMatchCard(
              isWin: false,
              type: 'RANKED SOLO • 32M',
              kda: '4 / 7 / 3',
              kdaRatio: '1.0 KDA',
            ),
            const SizedBox(height: 12),
            _buildMatchCard(
              isWin: true,
              type: 'RANKED SOLO • 24M',
              kda: '8 / 1 / 14',
              kdaRatio: '22.0 KDA',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          NexusBottomNav(
            currentIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              NexusBottomNavItem(icon: Icons.grid_view, label: 'Nexus'),
              NexusBottomNavItem(icon: Icons.sports_kabaddi, label: 'Matches'),
              NexusBottomNavItem(icon: Icons.shield_outlined, label: 'Skins'),
              NexusBottomNavItem(icon: Icons.person, label: 'Profile'),
            ],
          ),
          // Floating Action Button from design
          Positioned(
            top: -30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexusColors.background,
                border: Border.all(color: NexusColors.primary, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: NexusColors.primary.withValues(alpha: 0.5),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: NexusColors.textPrimary, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, {bool highlight = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: NexusColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: highlight ? NexusColors.primary : NexusColors.cardBorder,
            width: highlight ? 1.5 : 1.0,
          ),
          boxShadow: highlight
              ? [
                  BoxShadow(
                    color: NexusColors.primary.withValues(alpha: 0.1),
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: NexusTextStyles.caption.copyWith(color: NexusColors.textSecondary),
            ),
            const SizedBox(height: 8),
            Text(value, style: NexusTextStyles.title.copyWith(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchCard({
    required bool isWin,
    required String type,
    required String kda,
    required String kdaRatio,
  }) {
    final statusColor = isWin ? NexusColors.primary : NexusColors.textMuted;
    final statusText = isWin ? 'VICTORY' : 'DEFEAT';

    return Container(
      decoration: BoxDecoration(
        color: NexusColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NexusColors.cardBorder),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Champ icon placeholder
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: NexusColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Icon(Icons.image, color: statusColor, size: 24)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        statusText,
                        style: NexusTextStyles.title.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(type, style: NexusTextStyles.caption),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(kda, style: NexusTextStyles.title.copyWith(fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(kdaRatio, style: NexusTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
          // Result color bar
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: isWin
                  ? [
                      BoxShadow(
                        color: NexusColors.primary.withValues(alpha: 0.6),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, -2),
                      ),
                    ]
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
