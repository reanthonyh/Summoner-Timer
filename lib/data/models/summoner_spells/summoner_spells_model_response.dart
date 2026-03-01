import 'package:freezed_annotation/freezed_annotation.dart';

import './summoner_spell_model.dart';

part 'summoner_spells_model_response.freezed.dart';
part 'summoner_spells_model_response.g.dart';

@freezed
abstract class SummonerSpellsModelResponse with _$SummonerSpellsModelResponse {
  const factory SummonerSpellsModelResponse({
    String? type,
    String? version,
    Map<String, SummonerSpellModel>? data,
  }) = _SummonerSpellsModelResponse;

  factory SummonerSpellsModelResponse.fromJson(Map<String, Object?> json) =>
      _$SummonerSpellsModelResponseFromJson(json);
}
