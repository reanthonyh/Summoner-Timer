import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';

final class GetCurrentGameUseCase {
  GetCurrentGameUseCase({required this.repository});

  final SpectatorRepository repository;

  AsyncResult<GameInformation> call() {
    return repository.findOnGameMatch();
  }
}
