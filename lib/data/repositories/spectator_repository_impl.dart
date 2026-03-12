import 'package:dio/dio.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';

class ApiException implements Exception {
  ApiException({
    required this.message,
    this.statusCode,
    this.responseBody,
    this.errorType,
  });

  final String message;
  final int? statusCode;
  final String? responseBody;
  final String? errorType;

  @override
  String toString() {
    final buffer = StringBuffer(message);
    if (statusCode != null) {
      buffer.write(' (Status: $statusCode)');
    }
    if (errorType != null) {
      buffer.write(' - $errorType');
    }
    return buffer.toString();
  }
}

final class SpectatorRepositoryImpl implements SpectatorRepository {
  SpectatorRepositoryImpl({
    required this.dataSource,
    required DataDragonApi dataDragonDataSource,
    required SessionRepository sessionRepository,
  }) : _dataDragonDataSource = dataDragonDataSource,
       _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final DataDragonApi _dataDragonDataSource;
  final SessionRepository _sessionRepository;

  @override
  Future<Result<GameInformation, Exception>> findOnGameMatch() async {
    try {
      final puuid = _sessionRepository.currentAccount?.puuid;

      if (puuid == null) {
        throw Exception('Account not setted with puuid');
      }

      final response = await dataSource.getMatchInformation(puuid);

      final summonerSpellsResponse = await _dataDragonDataSource.getSummonerSpells();
      final spellsData = summonerSpellsResponse.data ?? {};

      final userParticipant = response.participants?.firstWhere(
        (p) => p.puuid == puuid,
        orElse: () => const ParticipantModel(),
      );
      final userTeamId = userParticipant?.teamId ?? 0;

      final List<GameParticipant> players =
          response.participants
              ?.map(
                (player) => GameParticipantMapper.fromModel(
                  player,
                  spellsData,
                  userTeamId,
                  _dataDragonDataSource,
                ),
              )
              .toList() ??
          [];

      return Result.success(
        GameInformation(matchId: response.gameId.toString(), players: players),
      );
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
