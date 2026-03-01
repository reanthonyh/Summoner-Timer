import 'package:freezed_annotation/freezed_annotation.dart';

import 'game_participant.dart';

part 'game_information.freezed.dart';

@freezed
abstract class GameInformation with _$GameInformation {
  const factory GameInformation({
    required String? matchId,
    required List<GameParticipant> players,
  }) = _GameInformation;
}
