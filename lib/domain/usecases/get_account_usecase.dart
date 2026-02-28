import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

class GetAccountUseCase {
  GetAccountUseCase({required this.repository});

  final AccountRepository repository;

  Future<Account> call({required String name, required String tag}) {
    return repository.retrieveUserByNameTag(name: name, tag: tag);
  }
}
