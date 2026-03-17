// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_spell_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummonerSpellImageModel _$SummonerSpellImageModelFromJson(Map<String, dynamic> json) =>
    _SummonerSpellImageModel(
      full: json['full'] as String?,
      sprite: json['sprite'] as String?,
      group: json['group'] as String?,
      x: (json['x'] as num?)?.toInt(),
      y: (json['y'] as num?)?.toInt(),
      w: (json['w'] as num?)?.toInt(),
      h: (json['h'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummonerSpellImageModelToJson(_SummonerSpellImageModel instance) =>
    <String, dynamic>{
      'full': instance.full,
      'sprite': instance.sprite,
      'group': instance.group,
      'x': instance.x,
      'y': instance.y,
      'w': instance.w,
      'h': instance.h,
    };
