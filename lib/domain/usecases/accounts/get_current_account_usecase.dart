import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class GetCurrentAccountUseCase {
  GetCurrentAccountUseCase({required this.repository});

  final SessionRepository repository;

  Account? call() {
    return repository.currentAccount;
  }
}
