import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';

class NexusBottomNavItem {
  final IconData icon;
  final String label;

  NexusBottomNavItem({required this.icon, required this.label});
}

class NexusBottomNav extends StatelessWidget {
  final List<NexusBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const NexusBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: NexusColors.background,
        border: Border(
          top: BorderSide(color: NexusColors.cardBorder.withValues(alpha: 0.5), width: 1),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isActive = index == currentIndex;

            return GestureDetector(
              onTap: () => onItemSelected(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isActive ? NexusColors.primary : NexusColors.textSecondary,
                    size: 24,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.label.toUpperCase(),
                    style: NexusTextStyles.caption.copyWith(
                      color: isActive ? NexusColors.primary : NexusColors.textSecondary,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
