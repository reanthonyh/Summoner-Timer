// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_spell_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummonerSpellModel _$SummonerSpellModelFromJson(Map<String, dynamic> json) =>
    _SummonerSpellModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      cooldown: (json['cooldown'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      key: (json['key'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : SummonerSpellImageModel.fromJson(
              json['image'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SummonerSpellModelToJson(_SummonerSpellModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cooldown': instance.cooldown,
      'key': instance.key,
      'image': instance.image,
    };
