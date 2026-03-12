// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_spells_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummonerSpellsModelResponse _$SummonerSpellsModelResponseFromJson(
  Map<String, dynamic> json,
) => _SummonerSpellsModelResponse(
  type: json['type'] as String?,
  version: json['version'] as String?,
  data: (json['data'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, SummonerSpellModel.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$SummonerSpellsModelResponseToJson(
  _SummonerSpellsModelResponse instance,
) => <String, dynamic>{
  'type': instance.type,
  'version': instance.version,
  'data': instance.data,
};
