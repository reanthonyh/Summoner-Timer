import 'package:shared_preferences/shared_preferences.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    RiotAmericasApi? dataSource,
    required SessionRepository sessionRepository,
  }) : dataSource = dataSource ?? RiotAmericasApi(sessionRepository: sessionRepository),
       _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final SessionRepository _sessionRepository;

  static const _accountsKey = 'saved_account_puuids';

  @override
  Future<Account> retrieveSummonerByPUUID(String puuid) async {
    try {
      final accountResponse = await dataSource.getAccountByPUUID(puuid);

      if (accountResponse.puuid == null) {
        throw Exception('Account not found for PUUID: $puuid');
      }

      final regionResponse = await dataSource.getSummonerRegion(puuid);

      final account = AccountMapper.fromModels(
        accountModel: accountResponse,
        regionModel: regionResponse,
      );

      _sessionRepository.setAccount(account);

      return account;
    } catch (err) {
      print('Repository Impl: Error retrieving account: $err');
      rethrow;
    }
  }

  @override
  Future<Account> retrieveSummonerByNameTag({
    required String name,
    required String tag,
  }) async {
    try {
      final request = AccountModelRequest(name: name, tag: tag);

      final accountResponse = await dataSource.getAccount(request);

      final puuid = accountResponse.puuid;
      if (puuid == null) {
        throw Exception('Account not found for $name#$tag');
      }

      final regionResponse = await dataSource.getSummonerRegion(puuid);

      final account = AccountMapper.fromModels(
        accountModel: accountResponse,
        regionModel: regionResponse,
      );

      _sessionRepository.setAccount(account);

      return account;
    } catch (e) {
      print('Repository Impl: Error retrieving account: $e');
      rethrow;
    }
  }

  @override
  Future<List<Account>> getSavedAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getStringList(_accountsKey) ?? [];

    final accounts = <Account>[];

    for (final json in accountsJson) {
      try {
        final accountResponse = await dataSource.getAccountByPUUID(json);

        if (accountResponse.puuid == null) {
          throw Exception('Account not found for PUUID: $json');
        }

        final regionResponse = await dataSource.getSummonerRegion(json);

        final account = AccountMapper.fromModels(
          accountModel: accountResponse,
          regionModel: regionResponse,
        );

        accounts.add(account);
      } catch (err) {
        print('Repository Impl: Error retrieving saved account: $err');
      }
    }

    return accounts;
  }

  @override
  Future<void> saveAccountPUUID(Account account) async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getStringList(_accountsKey) ?? [];

    final puuid = account.puuid;
    if (!accountsJson.contains(puuid)) {
      accountsJson.insert(0, puuid);
      await prefs.setStringList(_accountsKey, accountsJson);
    }
  }
}
