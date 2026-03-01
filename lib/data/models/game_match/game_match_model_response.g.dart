// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_match_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameMatchModelResponse _$GameMatchModelResponseFromJson(
  Map<String, dynamic> json,
) => _GameMatchModelResponse(
  gameId: (json['gameId'] as num?)?.toInt(),
  mapId: (json['mapId'] as num?)?.toInt(),
  gameMode: json['gameMode'] as String?,
  gameType: json['gameType'] as String?,
  participants: (json['participants'] as List<dynamic>?)
      ?.map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  platformId: json['platformId'] as String?,
);

Map<String, dynamic> _$GameMatchModelResponseToJson(
  _GameMatchModelResponse instance,
) => <String, dynamic>{
  'gameId': instance.gameId,
  'mapId': instance.mapId,
  'gameMode': instance.gameMode,
  'gameType': instance.gameType,
  'participants': instance.participants,
  'platformId': instance.platformId,
};
