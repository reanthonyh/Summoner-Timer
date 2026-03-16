import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AccountRepository {
  AsyncResult<Account> retrieveSummonerByNameTag({
    required String name,
    required String tag,
  });

  AsyncResult<Account> retrieveSummonerByPUUID(String puuid);

  AsyncResult<List<Account>> getSavedAccounts();

  AsyncResult<Unit> saveAccount(Account account);
}
