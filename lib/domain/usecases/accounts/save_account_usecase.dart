import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class SaveAccountUseCase {
  SaveAccountUseCase({required this.repository});

  final AccountRepository repository;

  Future<Result<void, Exception>> call(Account account) {
    return repository.saveAccount(account);
  }
}
