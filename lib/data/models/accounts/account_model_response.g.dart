// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModelResponse _$AccountModelResponseFromJson(
  Map<String, dynamic> json,
) => _AccountModelResponse(
  puuid: json['puuid'] as String?,
  gameName: json['gameName'] as String?,
  tagLine: json['tagLine'] as String?,
  profileIconId: (json['profileIconId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccountModelResponseToJson(
  _AccountModelResponse instance,
) => <String, dynamic>{
  'puuid': instance.puuid,
  'gameName': instance.gameName,
  'tagLine': instance.tagLine,
  'profileIconId': instance.profileIconId,
};
