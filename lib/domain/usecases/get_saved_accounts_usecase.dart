import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class GetSavedAccountsUseCase {
  GetSavedAccountsUseCase({required this.repository});

  final AccountRepository repository;

  Future<List<Account>> call() {
    return repository.getSavedAccounts();
  }
}
