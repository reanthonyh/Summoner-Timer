import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SpectatorRepository {
  Future<GameInformation> findOnGameMatch();
}
