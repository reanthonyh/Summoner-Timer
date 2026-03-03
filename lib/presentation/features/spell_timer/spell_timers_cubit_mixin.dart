import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'enemy_team_spell_timers_state.dart';

/// A mixin that provides shared spell-timer logic for any [Cubit] whose
/// state exposes a [Map<String, SpellTimerData>] via [getSpellTimers] /
/// [withSpellTimers].
///
/// Concrete cubits (e.g. [EnemyTeamSpellTimersCubit], [ManualToolCubit])
/// mix in this class and implement the two abstract helpers so the mixin
/// can read and write the timer map without knowing the full state type.
///
/// Usage:
/// ```dart
/// final class MyCubit extends Cubit<MyState>
///     with SpellTimersMixin<MyState> {
///
///   @override
///   Map<String, SpellTimerData> getSpellTimers(MyState s) => s.spellTimers;
///
///   @override
///   MyState withSpellTimers(Map<String, SpellTimerData> t) =>
///       state.copyWith(spellTimers: t);
/// }
/// ```
mixin SpellTimersMixin<S> on Cubit<S> {
  Timer? _timer;

  /// Returns the spell-timer map from [s].
  Map<String, SpellTimerData> getSpellTimers(S s);

  /// Returns a copy of the current state with [timers] applied.
  S withSpellTimers(Map<String, SpellTimerData> timers);

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Starts (or restarts) the countdown for [key].
  void startSpellTimer(String key) {
    final spellData = getSpellTimers(state)[key];
    if (spellData == null || spellData.spell.cooldownSeconds <= 0) return;

    final updated = _copyTimers();
    updated[key] = spellData.copyWith(
      remainingSeconds: spellData.spell.cooldownSeconds,
      isActive: true,
      progress: 0.0,
    );

    emit(withSpellTimers(updated));
    _startSharedTimer();
  }

  /// Resets [key] to its full cooldown and marks it inactive.
  void resetSpellTimer(String key) {
    final spellData = getSpellTimers(state)[key];
    if (spellData == null) return;

    final updated = _copyTimers();
    updated[key] = spellData.copyWith(
      remainingSeconds: spellData.spell.cooldownSeconds,
      isActive: false,
      progress: 1.0,
    );

    emit(withSpellTimers(updated));

    if (!updated.values.any((s) => s.isActive)) {
      _timer?.cancel();
    }
  }

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  void _startSharedTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    final updated = _copyTimers();
    bool anyActive = false;

    for (final entry in updated.entries) {
      final spellData = entry.value;
      if (!spellData.isActive) continue;

      anyActive = true;

      if (spellData.remainingSeconds > 0) {
        final newRemaining = spellData.remainingSeconds - 1;
        final newProgress = 1.0 - (newRemaining / spellData.spell.cooldownSeconds);
        updated[entry.key] = spellData.copyWith(
          remainingSeconds: newRemaining,
          progress: newProgress,
        );
      } else {
        updated[entry.key] = spellData.copyWith(
          remainingSeconds: spellData.spell.cooldownSeconds,
          isActive: false,
          progress: 1.0,
        );
      }
    }

    emit(withSpellTimers(updated));

    if (!anyActive) {
      _timer?.cancel();
    }
  }

  Map<String, SpellTimerData> _copyTimers() =>
      Map<String, SpellTimerData>.from(getSpellTimers(state));

  void cancelTimer() => _timer?.cancel();
}
