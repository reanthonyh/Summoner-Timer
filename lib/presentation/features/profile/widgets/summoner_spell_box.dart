import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/summoner_spell.dart';

class SummonerSpellBox extends StatefulWidget {
  final SummonerSpell spell;

  const SummonerSpellBox({super.key, required this.spell});

  @override
  State<SummonerSpellBox> createState() => _SummonerSpellBoxState();
}

class _SummonerSpellBoxState extends State<SummonerSpellBox>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late AnimationController _animationController;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.spell.cooldownSeconds;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.spell.cooldownSeconds),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _initiateTimer() {
    if (_remainingSeconds <= 0) return;

    _timer?.cancel();
    _animationController.reset();
    _animationController.duration = Duration(seconds: widget.spell.cooldownSeconds);
    _animationController.forward();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          _animationController.reset();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _animationController.reset();
    setState(() {
      _remainingSeconds = widget.spell.cooldownSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _initiateTimer,
      onLongPress: _resetTimer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: widget.spell.imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Container(width: 48, height: 48, color: Colors.grey[300]),
            errorWidget: (context, url, error) => Container(
              width: 48,
              height: 48,
              color: Colors.red[300],
              child: const Icon(Icons.error),
            ),
          ),
          if (_remainingSeconds < widget.spell.cooldownSeconds)
            Positioned(
              top: 0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _remainingSeconds.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
