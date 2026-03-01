import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

class SummonerSpellBox extends StatefulWidget {
  final SummonerSpell spell;

  const SummonerSpellBox({super.key, required this.spell});

  @override
  State<SummonerSpellBox> createState() => _SummonerSpellBoxState();
}

class _SummonerSpellBoxState extends State<SummonerSpellBox>
    with TickerProviderStateMixin {
  Timer? _timer;
  late AnimationController _progressController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  int _remainingSeconds = 0;
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.spell.cooldownSeconds;
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.spell.cooldownSeconds),
    );
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
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _initiateTimer() {
    if (_remainingSeconds <= 0) return;

    _timer?.cancel();
    _progressController.reset();
    _progressController.duration = Duration(seconds: widget.spell.cooldownSeconds);
    _progressController.forward();

    if (!_isActive) {
      _isActive = true;
      _fadeController.forward();
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          _progressController.reset();
          _isActive = false;
          _fadeController.reverse();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _progressController.reset();
    setState(() {
      _remainingSeconds = widget.spell.cooldownSeconds;
      _isActive = false;
    });
    _fadeController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _initiateTimer,
      onLongPress: _resetTimer,
      child: SizedBox(
        width: 56,
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.spell.imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.error, color: Colors.white),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(56, 56),
                    painter: _CooldownPainter(
                      progress: _progressController.value,
                      remainingSeconds: _remainingSeconds,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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

    // Paint a color layer that fades out as the cooldown progresses
    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    final layerPaint = Paint()
      ..color = Colors.black.withValues(alpha: opacity * 0.7)
      ..style = PaintingStyle.fill;

    // Drawing a rounded rectangle that covers the spell box area (matching image size)
    final rect = Rect.fromCenter(center: center, width: 48, height: 48);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)), layerPaint);

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
