import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/data/datasources/local_account_datasource.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/datasources/riot_summoner_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({
    required this.dataSource,
    required this.localDataSource,
    required this.summonerDataSource,
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final RiotSummonerApi summonerDataSource;
  final LocalAccountDataSource localDataSource;
  final SessionRepository _sessionRepository;

  @override
  Future<Result<Account, Exception>> retrieveSummonerByPUUID(String puuid) async {
    try {
      final accountResponseResult = await dataSource.getAccountByPUUID(puuid);

      if (accountResponseResult.puuid == null) {
        throw Exception('Account not found for PUUID: $puuid');
      }

      final summonerResponse = await summonerDataSource.getSummonerByPUUID(puuid);
      final accountResponse = accountResponseResult.copyWith(
        profileIconId: summonerResponse.profileIconId,
      );

      final regionResponse = await dataSource.getSummonerRegion(puuid);

      final account = AccountMapper.fromModels(
        accountModel: accountResponse,
        regionModel: regionResponse,
      );

      _sessionRepository.setAccount(account);

      return Result.success(account);
    } catch (err) {
      print('Repository Impl: Error retrieving account: $err');
      return Result.failure(err as Exception);
    }
  }

  @override
  Future<Result<Account, Exception>> retrieveSummonerByNameTag({
    required String name,
    required String tag,
  }) async {
    try {
      final request = AccountModelRequest(name: name, tag: tag);

      final accountResponseResult = await dataSource.getAccount(request);

      final puuid = accountResponseResult.puuid;
      if (puuid == null) {
        throw Exception('Account not found for $name#$tag');
      }

      final summonerResponse = await summonerDataSource.getSummonerByPUUID(puuid);
      final accountResponse = accountResponseResult.copyWith(
        profileIconId: summonerResponse.profileIconId,
      );

      final regionResponse = await dataSource.getSummonerRegion(puuid);

      final account = AccountMapper.fromModels(
        accountModel: accountResponse,
        regionModel: regionResponse,
      );

      _sessionRepository.setAccount(account);

      return Result.success(account);
    } catch (e) {
      print('Repository Impl: Error retrieving account: $e');
      return Result.failure(e as Exception);
    }
  }

  @override
  Future<Result<List<Account>, Exception>> getSavedAccounts() async {
    try {
      final accounts = await localDataSource.getSavedAccounts();
      return Result.success(accounts);
    } catch (e) {
      return Result.failure(e as Exception);
    }
  }

  @override
  Future<Result<void, Exception>> saveAccount(Account account) async {
    try {
      await localDataSource.saveAccount(account);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(e as Exception);
    }
  }
}

