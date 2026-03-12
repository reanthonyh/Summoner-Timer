import 'dart:async';
import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

class SummonerSpellCard extends StatefulWidget {
  const SummonerSpellCard({super.key, required this.spell});

  final SummonerSpell spell;

  @override
  State<SummonerSpellCard> createState() => _SummonerSpellCardState();
}

class _SummonerSpellCardState extends State<SummonerSpellCard> {
  int _remainingSeconds = 0;
  Timer? _timer;

  bool get _isActive => _remainingSeconds > 0;

  void _startTimer() {
    if (_isActive) return;
    setState(() {
      _remainingSeconds = widget.spell.cooldownSeconds;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _remainingSeconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startTimer,
      onLongPress: _stopTimer,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _isActive ? Colors.red.withOpacity(0.3) : Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isActive ? Colors.red : Colors.grey[700]!, width: 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget
                    .spell
                    .imageUrl
                    .isNotEmpty) // Use spriteUrl or imageUrl depending on API
                  Image.network(
                    widget.spell.imageUrl,
                    width: 40,
                    height: 40,
                    errorBuilder: (_, _, _) =>
                        const Icon(Icons.flash_on, color: Colors.amber),
                  )
                else
                  const Icon(Icons.flash_on, color: Colors.amber),
              ],
            ),
            if (_isActive)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    '$_remainingSeconds',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
