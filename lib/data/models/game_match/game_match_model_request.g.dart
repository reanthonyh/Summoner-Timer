// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_match_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameMatchModelRequest _$GameMatchModelRequestFromJson(Map<String, dynamic> json) =>
    _GameMatchModelRequest(
      puuid: json['puuid'] as String,
      platform: $enumDecode(_$RiotPlatformEnumMap, json['platform']),
    );

Map<String, dynamic> _$GameMatchModelRequestToJson(_GameMatchModelRequest instance) =>
    <String, dynamic>{
      'puuid': instance.puuid,
      'platform': _$RiotPlatformEnumMap[instance.platform]!,
    };

const _$RiotPlatformEnumMap = {
  RiotPlatform.la1: 'la1',
  RiotPlatform.la2: 'la2',
  RiotPlatform.na1: 'na1',
  RiotPlatform.euw1: 'euw1',
  RiotPlatform.eun1: 'eun1',
};
