import 'package:dio/dio.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/core/exceptions/exceptions.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/data/datasources/riot_platform_source.dart';
import 'package:summoner_timer/data/datasources/riot_region_source.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class SpectatorRepositoryImpl implements SpectatorRepository {
  SpectatorRepositoryImpl({
    required this.riotApi,
    required this.riotPlatformSource,
    required SessionRepository sessionRepository,
    required SummonerSpellsRepository summonerSpellsRepository,
  }) : _sessionRepository = sessionRepository,
       _summonerSpellsRepository = summonerSpellsRepository;

  final RiotRegionSource riotApi;
  final RiotPlatformSource riotPlatformSource;
  final SessionRepository _sessionRepository;
  final SummonerSpellsRepository _summonerSpellsRepository;

  GameInformation? _cachedGameInfo;
  DateTime? _lastFetchTime;

  static const _cacheValidDuration = Duration(minutes: 20);

  bool get _isCacheValid {
    if (_cachedGameInfo == null || _lastFetchTime == null) return false;
    return DateTime.now().difference(_lastFetchTime!) < _cacheValidDuration;
  }

  @override
  Future<Result<GameInformation, Exception>> findOnGameMatch() async {
    if (_isCacheValid) {
      return Result.success(_cachedGameInfo!);
    }

    try {
      final puuid = _sessionRepository.currentAccount?.puuid;

      if (puuid == null) {
        throw Exception('Account not setted with puuid');
      }

      final request = GameMatchModelRequest(
        puuid: puuid,
        platform: _sessionRepository.platformHost,
      );

      final response = await riotPlatformSource.getMatchInformation(request);

      final summonerSpellsResult = await _summonerSpellsRepository.getSummonerSpells();

      final spellsList = summonerSpellsResult.when(
        success: (spells) => spells,
        failure: (_) => <SummonerSpell>[],
      );

      final userParticipant = response.participants?.firstWhere(
        (p) => p.puuid == puuid,
        orElse: () => const ParticipantModel(),
      );
      final userTeamId = userParticipant?.teamId ?? 0;

      final List<GameParticipant> players =
          response.participants
              ?.map(
                (player) => GameParticipantMapper.fromModelWithEntities(
                  player,
                  spellsList,
                  userTeamId,
                ),
              )
              .toList() ??
          [];

      final gameInfo = GameInformation(
        matchId: response.gameId.toString(),
        players: players,
      );

      _cachedGameInfo = gameInfo;
      _lastFetchTime = DateTime.now();

      return Result.success(gameInfo);
    } on DioException catch (e) {
      return Result.failure(
        ApiException(
          message: e.message ?? 'Network error occurred',
          statusCode: e.response?.statusCode,
          responseBody: e.response?.data?.toString(),
          errorType: e.type.name,
        ),
      );
    } catch (e) {
      return Result.failure(ApiException(message: e.toString()));
    }
  }
}
