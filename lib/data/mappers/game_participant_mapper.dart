import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/models/game_match/participant_model.dart';
import 'package:summoner_timer/data/models/summoner_spells/summoner_spell_model.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

import 'summoner_spell_mapper.dart';

class GameParticipantMapper {
  GameParticipantMapper._();

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
}
