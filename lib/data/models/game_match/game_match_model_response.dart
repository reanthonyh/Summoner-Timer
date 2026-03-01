import 'package:freezed_annotation/freezed_annotation.dart';

import './participant_model.dart';

part 'game_match_model_response.g.dart';
part 'game_match_model_response.freezed.dart';

@freezed
abstract class GameMatchModelResponse with _$GameMatchModelResponse {
  const factory GameMatchModelResponse({
    int? gameId,
    int? mapId,
    String? gameMode,
    String? gameType,
    List<ParticipantModel>? participants,
    String? platformId,
  }) = _GameMatchModelResponse;

  factory GameMatchModelResponse.fromJson(Map<String, Object?> json) =>
      _$GameMatchModelResponseFromJson(json);
}
