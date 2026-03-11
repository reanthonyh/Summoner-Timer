import 'dart:async';

import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class AccountRepository {
  Future<Account> retrieveSummonerByNameTag({required String name, required String tag});

  Future<Account> retrieveSummonerByPUUID(String puuid);

  Future<List<Account>> getSavedAccounts();

  Future<void> saveAccount(Account account);
}
