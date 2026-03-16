import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SpectatorRepository {
  AsyncResult<GameInformation> findOnGameMatch();
}
