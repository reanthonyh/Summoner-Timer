import 'package:summoner_timer/domain/entities/entities.dart';

Account createTestAccount({
  String puuid = 'test-puuid-123',
  int level = 100,
  String gameName = 'TestSummoner',
  String tagLine = 'NA1',
  Region region = Region.na,
  String iconUrl = 'https://ddragon.leagueoflegends.com/cdn/16.5.1/img/profileicon/1.png',
}) {
  return Account(
    puuid: puuid,
    level: level,
    gameName: gameName,
    tagLine: tagLine,
    region: region,
    iconUrl: iconUrl,
  );
}

GameParticipant createTestGameParticipant({
  String? puuid = 'participant-puuid',
  bool isBot = false,
  required SummonerSpell spellOne,
  required SummonerSpell spellTwo,
  String riotId = 'TestPlayer#NA1',
  int championId = 1,
  Team team = Team.ally,
}) {
  return GameParticipant(
    puuid: puuid,
    isBot: isBot,
    spellOne: spellOne,
    spellTwo: spellTwo,
    riotId: riotId,
    championId: championId,
    team: team,
  );
}

GameInformation createTestGameInformation({
  String? matchId = 'match-123',
  List<GameParticipant> players = const [],
}) {
  return GameInformation(
    matchId: matchId,
    players: players,
  );
}

SummonerSpell createTestSummonerSpell({
  String id = '4',
  String name = 'Flash',
  int cooldownSeconds = 300,
  String spriteUrl = 'https://ddragon.leagueoflegends.com/cdn/16.5.1/img/sprite/spell0.png',
  String imageUrl = 'https://ddragon.leagueoflegends.com/cdn/16.5.1/img/spell/Flash.png',
  List<String> modes = const ['CLASSIC', 'ARAM'],
}) {
  return SummonerSpell(
    id: id,
    name: name,
    cooldownSeconds: cooldownSeconds,
    spriteUrl: spriteUrl,
    imageUrl: imageUrl,
    modes: modes,
  );
}