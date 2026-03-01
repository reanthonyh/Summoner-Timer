import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';

final class SpectatorRepositoryImpl implements SpectatorRepository {
  SpectatorRepositoryImpl({
    RiotAmericasApi? dataSource,
    DataDragonApi? dataDragonDataSource,
    required SessionRepository sessionRepository,
  }) : dataSource = dataSource ?? RiotAmericasApi(sessionRepository: sessionRepository),
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

    // Find the current user's teamId to distinguish between allies and enemies
    final userParticipant = response.participants?.firstWhere(
      (p) => p.puuid == puuid,
      orElse: () => const ParticipantModel(),
    );
    final userTeamId = userParticipant?.teamId ?? 0;

    final List<GameParticipant> players =
        response.participants
            ?.map(
              (player) => GameParticipantMapper.fromModel(player, spellsData, userTeamId),
            )
            .toList() ??
        [];

    return GameInformation(matchId: response.gameId.toString(), players: players);
  }
}
