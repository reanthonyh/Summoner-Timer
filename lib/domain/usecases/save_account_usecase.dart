import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class SaveAccountUseCase {
  SaveAccountUseCase({required this.repository});

  final AccountRepository repository;

  Future<void> call(Account account) {
    return repository.saveAccount(account);
  }
}
