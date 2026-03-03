import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

/// A spell icon that optionally displays a cooldown overlay.
///
/// When [isActive] is true, a semi-transparent dark layer and a countdown
/// text are painted on top of the spell image.
///
/// Provide [onTap] and [onLongPress] to hook up start / reset actions.
class SummonerSpellBox extends StatefulWidget {
  const SummonerSpellBox({
    super.key,
    required this.spell,
    this.isActive = false,
    this.remainingSeconds,
    this.progress = 1.0,
    this.onTap,
    this.onLongPress,
  });

  final SummonerSpell spell;

  /// Whether the cooldown is currently counting down.
  final bool isActive;

  /// Seconds remaining; defaults to [spell.cooldownSeconds] when not provided.
  final int? remainingSeconds;

  /// Countdown progress from 0.0 (just started) to 1.0 (ready).
  final double progress;

  /// Called when the user taps the box (usually to start the cooldown).
  final VoidCallback? onTap;

  /// Called when the user long-presses (usually to reset the cooldown).
  final VoidCallback? onLongPress;

  @override
  State<SummonerSpellBox> createState() => _SummonerSpellBoxState();
}

class _SummonerSpellBoxState extends State<SummonerSpellBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(SummonerSpellBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      widget.isActive ? _fadeController.forward() : _fadeController.reverse();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = widget.remainingSeconds ?? widget.spell.cooldownSeconds;

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: SizedBox(
        width: 56,
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _SpellImage(imageUrl: widget.spell.imageUrl),
            if (widget.onTap != null) // only show overlay in interactive mode
              FadeTransition(
                opacity: _fadeAnimation,
                child: CustomPaint(
                  size: const Size(56, 56),
                  painter: _CooldownPainter(
                    progress: widget.progress,
                    remainingSeconds: remaining,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Private helpers
// =============================================================================

class _SpellImage extends StatelessWidget {
  const _SpellImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) => Container(
          width: 48,
          height: 48,
          color: Colors.red[900],
          child: const Icon(Icons.error, color: Colors.white, size: 20),
        ),
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 48,
            height: 48,
            color: Colors.grey[800],
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CooldownPainter extends CustomPainter {
  _CooldownPainter({required this.progress, required this.remainingSeconds});

  final double progress;
  final int remainingSeconds;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Dark overlay fades out as progress approaches 1.0 (ready).
    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 48, height: 48),
        const Radius.circular(8),
      ),
      Paint()
        ..color = Colors.black.withValues(alpha: opacity * 0.7)
        ..style = PaintingStyle.fill,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: remainingSeconds.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: remainingSeconds >= 100 ? 14 : 18,
          fontWeight: FontWeight.bold,
          shadows: const [
            Shadow(blurRadius: 4, color: Colors.black, offset: Offset(1, 1)),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant _CooldownPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.remainingSeconds != remainingSeconds;
  }
}
