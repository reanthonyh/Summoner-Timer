import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class GetSavedAccountsUseCase {
  GetSavedAccountsUseCase({required this.repository});

  final AccountRepository repository;

  Future<Result<List<Account>, Exception>> call() {
    return repository.getSavedAccounts();
  }
}
