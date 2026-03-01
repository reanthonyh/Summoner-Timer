import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';

final class SpectatorRepositoryImpl implements SpectatorRepository {
  SpectatorRepositoryImpl({
    RiotAmericasApi? dataSource,
    DataDragonApi? dataDragonDataSource,
    required SessionRepository sessionRepository,
  }) : dataSource =
           dataSource ?? RiotAmericasApi(client: RiotDioClient.getClient(RiotHost.la1)),
       _dataDragonDataSource = dataDragonDataSource ?? DataDragonApi(),
       _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final DataDragonApi _dataDragonDataSource;
  final SessionRepository _sessionRepository;

  @override
  Future<GameInformation> findOnGameMatch() async {
    final puuid = _sessionRepository.currentAccount?.puuid;

    if (puuid == null) {
      throw Exception('Account not setted with puuid');
    }

    final response = await dataSource.getMatchInformation(puuid);

    final summonerSpellsResponse = await _dataDragonDataSource.getSummonerSpells();
    final spellsData = summonerSpellsResponse.data ?? {};

    final List<GameParticipant> players =
        response.participants
            ?.map((player) => GameParticipantMapper.fromModel(player, spellsData))
            .toList() ??
        [];

    return GameInformation(matchId: response.gameId.toString(), players: players);
  }
}
