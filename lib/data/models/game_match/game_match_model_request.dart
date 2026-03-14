import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';

part 'game_match_model_request.freezed.dart';
part 'game_match_model_request.g.dart';

@freezed
abstract class GameMatchModelRequest with _$GameMatchModelRequest {
  const factory GameMatchModelRequest({
    required String puuid,
    required RiotPlatform platform,
  }) = _GameMatchModelRequest;

  factory GameMatchModelRequest.fromJson(Map<String, dynamic> json) =>
      _$GameMatchModelRequestFromJson(json);
}
