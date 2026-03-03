import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';

final class SummonerSpellBox extends StatefulWidget {
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
  final bool isActive;
  final int? remainingSeconds;
  final double progress;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  bool get _isInteractive => onTap != null;

  @override
  State<SummonerSpellBox> createState() => _SummonerSpellBoxState();
}

class _SummonerSpellBoxState extends State<SummonerSpellBox>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeController;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();
    if (widget._isInteractive) {
      _initAnimation();
    }
  }

  @override
  void didUpdateWidget(SummonerSpellBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._isInteractive && _fadeController == null) {
      _initAnimation();
    }

    if (_fadeController != null && widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        // Only forward if not already doing so.
        if (!_fadeController!.isAnimating ||
            _fadeController!.status == AnimationStatus.reverse) {
          _fadeController!.forward();
        }
      } else {
        if (!_fadeController!.isAnimating ||
            _fadeController!.status == AnimationStatus.forward) {
          _fadeController!.reverse();
        }
      }
    }
  }

  void _initAnimation() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = _fadeController!.drive(CurveTween(curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _fadeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            if (widget._isInteractive && _fadeAnimation != null)
              FadeTransition(
                opacity: _fadeAnimation!,
                child: CustomPaint(
                  size: const Size(56, 56),
                  painter: _CooldownPainter(
                    progress: widget.progress,
                    remainingSeconds:
                        widget.remainingSeconds ?? widget.spell.cooldownSeconds,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

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
        errorBuilder: (context, error, stack) => ColoredBox(
          color: Colors.red.shade900,
          child: const SizedBox.square(
            dimension: 48,
            child: Icon(Icons.error, color: Colors.white, size: 20),
          ),
        ),
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return ColoredBox(
            color: Colors.grey.shade800,
            child: const SizedBox.square(
              dimension: 48,
              child: Center(
                child: SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
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

  final _overlayPaint = Paint()..style = PaintingStyle.fill;

  static const _imageSize = 48.0;
  static const _imageRadius = Radius.circular(8);
  static const _shadowOffset = Offset(1, 1);
  static const _textStyleLarge = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    shadows: [Shadow(blurRadius: 4, color: Colors.black, offset: _shadowOffset)],
  );
  static const _textStyleSmall = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    shadows: [Shadow(blurRadius: 4, color: Colors.black, offset: _shadowOffset)],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    _overlayPaint.color = Colors.black.withValues(alpha: opacity * 0.7);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: _imageSize, height: _imageSize),
        _imageRadius,
      ),
      _overlayPaint,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: remainingSeconds.toString(),
        style: remainingSeconds >= 100 ? _textStyleSmall : _textStyleLarge,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant _CooldownPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.remainingSeconds != remainingSeconds;
}
