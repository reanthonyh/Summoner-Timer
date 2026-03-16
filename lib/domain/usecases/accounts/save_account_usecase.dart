import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class SaveAccountUseCase {
  SaveAccountUseCase({required this.repository});

  final AccountRepository repository;

  AsyncResult<Unit> call(Account account) async {
    return repository.saveAccount(account);
  }
}
