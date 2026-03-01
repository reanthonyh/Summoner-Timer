import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';

class NexusTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;

  const NexusTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: NexusTextStyles.label.copyWith(color: NexusColors.primary),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: NexusColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: NexusColors.cardBorder),
          ),
          child: TextField(
            controller: controller,
            style: NexusTextStyles.body,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: NexusTextStyles.body.copyWith(color: NexusColors.textMuted),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: NexusColors.textSecondary)
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}
