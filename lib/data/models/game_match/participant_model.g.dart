// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    _ParticipantModel(
      puuid: json['puuid'] as String?,
      teamId: (json['teamId'] as num?)?.toInt(),
      spell1Id: (json['spell1Id'] as num?)?.toInt(),
      spell2Id: (json['spell2Id'] as num?)?.toInt(),
      riotId: json['riotId'] as String?,
      championId: (json['championId'] as num?)?.toInt(),
      profileIconId: (json['profileIconId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParticipantModelToJson(_ParticipantModel instance) =>
    <String, dynamic>{
      'puuid': instance.puuid,
      'teamId': instance.teamId,
      'spell1Id': instance.spell1Id,
      'spell2Id': instance.spell2Id,
      'riotId': instance.riotId,
      'championId': instance.championId,
      'profileIconId': instance.profileIconId,
    };
