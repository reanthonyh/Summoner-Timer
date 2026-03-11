import 'package:summoner_timer/data/datasources/local_account_datasource.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    required this.dataSource,
    required this.localDataSource,
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final LocalAccountDataSource localDataSource;
  final SessionRepository _sessionRepository;

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
    return localDataSource.getSavedAccounts();
  }

  @override
  Future<void> saveAccount(Account account) async {
    await localDataSource.saveAccount(account);
  }
}
