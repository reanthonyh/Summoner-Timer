import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_text_styles.dart';

class NexusButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? suffixIcon;
  final bool isLoading;

  const NexusButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.suffixIcon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        decoration: BoxDecoration(
          gradient: NexusColors.buttonGradient,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: NexusColors.primary.withValues(alpha: 0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: NexusColors.primary.withValues(alpha: 0.2),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: NexusColors.textPrimary,
                  strokeWidth: 2,
                ),
              )
            else ...[
              Text(
                text.toUpperCase(),
                style: NexusTextStyles.title.copyWith(fontSize: 16),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(width: 12),
                Icon(suffixIcon, color: NexusColors.textPrimary, size: 20),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
