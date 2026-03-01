import 'package:flutter/material.dart';

class NexusColors {
  static const Color background = Color(0xFF161113); // Dark background
  static const Color cardBackground = Color(0xFF22161A); // Slightly lighter for cards
  static const Color cardBorder = Color(0xFF3B2329); // Subtle red/brown border
  static const Color primary = Color(0xFFE91E45); // Bright red accent
  static const Color primaryDark = Color(
    0xFF6F303B,
  ); // Darker red for inactive buttons/glows
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFF8E7D81); // Grey text
  static const Color textMuted = Color(0xFF5A4B4F); // Very muted text

  static const Color success = Color(0xFF20E18A); // Online status green
  static const Color error = Color(0xFFFF4C4C); // Error text

  // Gradients
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF863341), Color(0xFF55212A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF22161A), Color(0xFF1A1013)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
