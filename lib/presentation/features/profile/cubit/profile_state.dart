import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    Account? account,
    required UiStatus status,
    String? message,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(status: .initial);
}
