import 'package:freezed_annotation/freezed_annotation.dart';

part 'summoner_model_response.freezed.dart';
part 'summoner_model_response.g.dart';

@freezed
abstract class SummonerModelResponse with _$SummonerModelResponse {
  const factory SummonerModelResponse({
    String? puuid,
    int? profileIconId,
    int? revisionDate,
    int? summonerLevel,
  }) = _SummonerModelResponse;

  factory SummonerModelResponse.fromJson(Map<String, Object?> json) =>
      _$SummonerModelResponseFromJson(json);
}
