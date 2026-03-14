import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

import 'summoner_spell_mapper.dart';

abstract final class GameParticipantMapper {
  static GameParticipant fromModel(
    ParticipantModel model,
    Map<String, SummonerSpellModel> spellsData,
    int userTeamId,
    DataDragonApi api,
  ) {
    return GameParticipant(
      puuid: model.puuid,
      isBot: false,
      spellOne: SummonerSpellMapper.fromSpellId(model.spell1Id ?? 0, spellsData, api),
      spellTwo: SummonerSpellMapper.fromSpellId(model.spell2Id ?? 0, spellsData, api),
      riotId: model.riotId ?? 'Unknown',
      championId: model.championId ?? 0,
      team: model.teamId == userTeamId ? Team.ally : Team.enemy,
    );
  }

  static GameParticipant fromModelWithEntities(
    ParticipantModel model,
    List<SummonerSpell> spells,
    int userTeamId,
  ) {
    return GameParticipant(
      puuid: model.puuid,
      isBot: false,
      spellOne: SummonerSpellMapper.fromSpellIdEntity(model.spell1Id ?? 0, spells),
      spellTwo: SummonerSpellMapper.fromSpellIdEntity(model.spell2Id ?? 0, spells),
      riotId: model.riotId ?? 'Unknown',
      championId: model.championId ?? 0,
      team: model.teamId == userTeamId ? Team.ally : Team.enemy,
    );
  }
}
