import 'package:summoner_timer/data/models/accounts/account_model_response.dart';
import 'package:summoner_timer/data/models/accounts/region_model_response.dart';
import 'package:summoner_timer/data/models/summoner_spells/summoner_spell_model.dart';
import 'package:summoner_timer/data/models/game_match/participant_model.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

class AccountMapper {
  AccountMapper._();

  static Account fromModels({
    required AccountModelResponse accountModel,
    required RegionModelResponse regionModel,
  }) {
    return Account(
      puuid: accountModel.puuid ?? '',
      gameName: accountModel.gameName ?? '',
      tagLine: accountModel.tagLine ?? '',
      region: Region.values.firstWhere(
        (element) => element.code == regionModel.region,
        orElse: () => Region.lan,
      ),
    );
  }
}

class SummonerSpellMapper {
  SummonerSpellMapper._();

  static SummonerSpell fromModel(SummonerSpellModel model) {
    return SummonerSpell(
      id: model.key?.toString() ?? '',
      name: model.name ?? '',
      cooldownSeconds: model.cooldown?.isNotEmpty == true ? model.cooldown!.first : 0,
    );
  }

  static SummonerSpell fromSpellId(
    int spellId,
    Map<String, SummonerSpellModel> spellsData,
  ) {
    final spellModel = spellsData.values.firstWhere(
      (spell) => spell.key == spellId,
      orElse: () =>
          SummonerSpellModel(id: spellId.toString(), name: 'Unknown', cooldown: [0]),
    );
    return fromModel(spellModel);
  }
}

class GameParticipantMapper {
  GameParticipantMapper._();

  static GameParticipant fromModel(
    ParticipantModel model,
    Map<String, SummonerSpellModel> spellsData,
  ) {
    return GameParticipant(
      puuid: model.puuid,
      isBot: false,
      spellOne: SummonerSpellMapper.fromSpellId(model.spell1Id ?? 0, spellsData),
      spellTwo: SummonerSpellMapper.fromSpellId(model.spell2Id ?? 0, spellsData),
    );
  }
}
