import 'package:freezed_annotation/freezed_annotation.dart';

part 'summoner_spell_image_model.freezed.dart';
part 'summoner_spell_image_model.g.dart';

@freezed
abstract class SummonerSpellImageModel with _$SummonerSpellImageModel {
  const factory SummonerSpellImageModel({
    String? full,
    String? sprite,
    String? group,
    int? x,
    int? y,
    int? w,
    int? h,
  }) = _SummonerSpellImageModel;

  factory SummonerSpellImageModel.fromJson(Map<String, Object?> json) =>
      _$SummonerSpellImageModelFromJson(json);
}
