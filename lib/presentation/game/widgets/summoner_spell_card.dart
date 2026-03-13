import 'package:flutter/material.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

final class SummonerSpellCard extends StatefulWidget {
  const SummonerSpellCard({super.key, required this.spell});

  final SummonerSpell spell;

  @override
  State<SummonerSpellCard> createState() => _SummonerSpellCardState();
}

class _SummonerSpellCardState extends State<SummonerSpellCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isCooldownActive = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.spell.cooldownSeconds),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isCooldownActive = false;
        });
        _controller.reset();
      }
    });
  }

  void _toggleTimer() {
    if (_isCooldownActive) {
      _controller.reset();
      setState(() {
        _isCooldownActive = false;
      });
    } else {
      setState(() {
        _isCooldownActive = true;
      });
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTimer,
      onLongPress: () {
        if (_isCooldownActive) {
          _controller.reset();
          setState(() {
            _isCooldownActive = false;
          });
        }
      },
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
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final remainingSeconds =
                        (widget.spell.cooldownSeconds * (1 - _controller.value)).ceil();
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox.expand(
                          child: CircularProgressIndicator(
                            value: 1 - _controller.value,
                            strokeWidth: 4,
                            backgroundColor: Colors.white10,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.redAccent,
                            ),
                          ),
                        ),
                        Text(
                          '$remainingSeconds',
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
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
