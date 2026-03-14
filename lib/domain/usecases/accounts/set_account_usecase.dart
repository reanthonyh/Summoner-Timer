import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class SetAccountUseCase {
  SetAccountUseCase({required this.repository});

  final SessionRepository repository;

  void call(Account account) {
    repository.setAccount(account);
  }
}
