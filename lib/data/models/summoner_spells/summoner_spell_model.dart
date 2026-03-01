import 'package:freezed_annotation/freezed_annotation.dart';

import 'summoner_spell_image_model.dart';

part 'summoner_spell_model.freezed.dart';
part 'summoner_spell_model.g.dart';

@freezed
abstract class SummonerSpellModel with _$SummonerSpellModel {
  // 1 - Cleanse
  // 3 - Exhaust
  // 4 - Flash
  // 6 - Ghost
  // 7 - Heal
  // 11 - Smite
  // 12 - Teleport
  // 13 - Clarity
  // 14 - Ignite
  // 21 - Barrier
  const factory SummonerSpellModel({
    int? id,
    String? name,
    String? description,
    List<int>? cooldown,
    int? key,
    SummonerSpellImageModel? image,
  }) = _SummonerSpellModel;

  factory SummonerSpellModel.fromJson(Map<String, Object?> json) =>
      _$SummonerSpellModelFromJson(json);
}
