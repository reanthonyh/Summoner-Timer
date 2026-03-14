import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class LogoutUseCase {
  LogoutUseCase({required this.repository});

  final SessionRepository repository;

  void call() {
    repository.clear();
  }
}
