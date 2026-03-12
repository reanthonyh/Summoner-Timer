import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';

final class GetCurrentGameUseCase {
  GetCurrentGameUseCase({required this.repository});

  final SpectatorRepository repository;

  Future<Result<GameInformation, Exception>> call() {
    return repository.findOnGameMatch();
  }
}
