import 'dart:async';

import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class AccountRepository {
  Future<Result<Account, Exception>> retrieveSummonerByNameTag({
    required String name,
    required String tag,
  });

  Future<Result<Account, Exception>> retrieveSummonerByPUUID(String puuid);

  Future<Result<List<Account>, Exception>> getSavedAccounts();

  Future<Result<void, Exception>> saveAccount(Account account);
}
