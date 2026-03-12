// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  puuid: json['puuid'] as String,
  gameName: json['gameName'] as String,
  tagLine: json['tagLine'] as String,
  region: $enumDecode(_$RegionEnumMap, json['region']),
  profileIconId: (json['profileIconId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'puuid': instance.puuid,
  'gameName': instance.gameName,
  'tagLine': instance.tagLine,
  'region': _$RegionEnumMap[instance.region]!,
  'profileIconId': instance.profileIconId,
};

const _$RegionEnumMap = {Region.lan: 'la1', Region.las: 'la2', Region.na: 'na1'};
