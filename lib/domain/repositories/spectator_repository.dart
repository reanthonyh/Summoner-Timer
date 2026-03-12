import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SpectatorRepository {
  Future<Result<GameInformation, Exception>> findOnGameMatch();
}
