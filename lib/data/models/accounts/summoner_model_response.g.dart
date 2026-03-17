// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummonerModelResponse _$SummonerModelResponseFromJson(Map<String, dynamic> json) =>
    _SummonerModelResponse(
      puuid: json['puuid'] as String?,
      profileIconId: (json['profileIconId'] as num?)?.toInt(),
      revisionDate: (json['revisionDate'] as num?)?.toInt(),
      summonerLevel: (json['summonerLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummonerModelResponseToJson(_SummonerModelResponse instance) =>
    <String, dynamic>{
      'puuid': instance.puuid,
      'profileIconId': instance.profileIconId,
      'revisionDate': instance.revisionDate,
      'summonerLevel': instance.summonerLevel,
    };
