import 'package:freezed_annotation/freezed_annotation.dart';

part 'summoner_model_response.freezed.dart';
part 'summoner_model_response.g.dart';

@freezed
abstract class SummonerModelResponse with _$SummonerModelResponse {
  const factory SummonerModelResponse({
    String? puuid,
    @JsonKey(name: 'profileIconId') int? profileIconId,
    @JsonKey(name: 'revisionDate') int? revisionDate,
    @JsonKey(name: 'summonerLevel') int? summonerLevel,
  }) = _SummonerModelResponse;

  factory SummonerModelResponse.fromJson(Map<String, Object?> json) =>
      _$SummonerModelResponseFromJson(json);
}
