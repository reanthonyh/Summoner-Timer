import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';

class NexusTextStyles {
  // Common tracking (letter-spacing)
  static const double tracking = 2.0;

  static const TextStyle header = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: NexusColors.textPrimary,
    letterSpacing: 2, // Slight tech look tracking
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: NexusColors.textPrimary,
    letterSpacing: 1.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: NexusColors.textSecondary,
    letterSpacing: 1,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: NexusColors.textPrimary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: NexusColors.textSecondary,
    letterSpacing: 1,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: NexusColors.textMuted,
  );
}
