import 'dart:async';
import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

final class SummonerSpellCard extends StatefulWidget {
  const SummonerSpellCard({
    super.key,
    required this.spell,
    this.isInteractive = true,
    this.onCooldownStateChanged,
  });

  final SummonerSpell spell;
  final bool isInteractive;
  final void Function(bool isActive)? onCooldownStateChanged;

  @override
  State<SummonerSpellCard> createState() => _SummonerSpellCardState();
}

class _SummonerSpellCardState extends State<SummonerSpellCard> {
  Timer? _timer;
  DateTime? _startTime;
  bool _isCooldownActive = false;

  int get _remainingSeconds {
    if (!_isCooldownActive || _startTime == null) return widget.spell.cooldownSeconds;
    final elapsed = DateTime.now().difference(_startTime!).inSeconds;
    final remaining = widget.spell.cooldownSeconds - elapsed;
    return remaining > 0 ? remaining : 0;
  }

  double get _progress {
    if (!_isCooldownActive || _startTime == null) return 1.0;
    final elapsed = DateTime.now().difference(_startTime!).inSeconds;
    final remaining = widget.spell.cooldownSeconds - elapsed;
    return (remaining / widget.spell.cooldownSeconds).clamp(0.0, 1.0);
  }

  @override
  void initState() {
    super.initState();
    _startTimerLoop();
  }

  void _startTimerLoop() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isCooldownActive) {
        setState(() {
          // Trigger rebuild to update time display
        });
        if (_remainingSeconds <= 0) {
          _stopTimer();
        }
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isCooldownActive = false;
      _startTime = null;
    });
    widget.onCooldownStateChanged?.call(false);
  }

  void _toggleTimer() {
    if (!widget.isInteractive) return;

    if (_isCooldownActive) {
      _stopTimer();
    } else {
      setState(() {
        _isCooldownActive = true;
        _startTime = DateTime.now();
      });
      widget.onCooldownStateChanged?.call(true);
    }
  }

  void _resetTimer() {
    if (_isCooldownActive) {
      _stopTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTimer,
      onLongPress: widget.isInteractive ? _resetTimer : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _isCooldownActive ? Colors.black87 : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isCooldownActive ? Colors.redAccent : Colors.grey[700]!,
            width: 2,
          ),
          boxShadow: _isCooldownActive
              ? [
                  BoxShadow(
                    color: Colors.redAccent.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Spell Image with Desaturation when on cooldown
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isCooldownActive ? 0.4 : 1.0,
                child: widget.spell.imageUrl.isNotEmpty
                    ? Image.network(
                        widget.spell.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const Icon(Icons.flash_on, color: Colors.amber),
                      )
                    : const Icon(Icons.flash_on, color: Colors.amber),
              ),

              // Cooldown Progress Overlay
              if (_isCooldownActive)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox.expand(
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 4,
                        backgroundColor: Colors.white10,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      ),
                    ),
                    Text(
                      '$_remainingSeconds',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
