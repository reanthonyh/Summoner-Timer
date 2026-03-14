import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract final class SummonerSpellMapper {
  static SummonerSpell fromModel(SummonerSpellModel model, DataDragonApi api) {
    return SummonerSpell(
      id: model.key?.toString() ?? '',
      name: model.name ?? '',
      cooldownSeconds: model.cooldown?.isNotEmpty == true ? model.cooldown!.first : 0,
      spriteUrl: model.image?.sprite != null
          ? api.getSpriteUrl(model.image!.sprite!)
          : '',
      imageUrl: model.image?.full != null ? api.getFullImageUrl(model.image!.full!) : '',
      modes: model.modes,
    );
  }

  static SummonerSpell fromSpellId(
    int spellId,
    Map<String, SummonerSpellModel> spellsData,
    DataDragonApi api,
  ) {
    final spellModel = spellsData.values.firstWhere(
      (spell) => int.parse(spell.key ?? '0') == spellId,
      orElse: () =>
          SummonerSpellModel(id: spellId.toString(), name: 'Unknown', cooldown: [0]),
    );
    return fromModel(spellModel, api);
  }

  static SummonerSpell fromSpellIdEntity(int spellId, List<SummonerSpell> spells) {
    return spells.firstWhere(
      (spell) => int.parse(spell.id) == spellId,
      orElse: () => SummonerSpell(
        id: spellId.toString(),
        name: 'Unknown',
        cooldownSeconds: 0,
        spriteUrl: '',
        imageUrl: '',
        modes: [],
      ),
    );
  }
}
