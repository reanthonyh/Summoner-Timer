import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/data/datasources/local_account_datasource.dart';
import 'package:summoner_timer/data/datasources/riot_region_source.dart';
import 'package:summoner_timer/data/datasources/riot_platform_source.dart';
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

  final RiotRegionSource dataSource;
  final RiotPlatformSource summonerDataSource;
  final LocalAccountDataSource localDataSource;
  final SessionRepository _sessionRepository;

  @override
  AsyncResult<Account> retrieveSummonerByPUUID(String puuid) async {
    try {
      final accountResult = await dataSource.getAccountByPUUID(puuid);

      if (accountResult.puuid == null) {
        throw Exception('Account not found for PUUID: $puuid');
      }

      final regionResult = await dataSource.getSummonerRegion(puuid);

      if (regionResult.region == null) {
        throw Exception('Region not found for PUUID: $puuid');
      }

      final summonerResult = await summonerDataSource.getSummonerByPUUID(
        GameMatchModelRequest(
          puuid: puuid,
          platform: RiotPlatform.values.firstWhere(
            (platform) => platform.name == regionResult.region,
            orElse: () => RiotPlatform.la1,
          ),
        ),
      );

      final account = AccountMapper.fromModels(
        accountModel: accountResult,
        summonerModel: summonerResult,
        regionModel: regionResult,
      );

      _sessionRepository.setAccount(account);

      return account.toSuccess();
    } catch (err) {
      print('Repository Impl: Error retrieving account: $err');
      return Exception('Failed to retrieve account: $err').toFailure();
    }
  }

  @override
  AsyncResult<Account> retrieveSummonerByNameTag({
    required String name,
    required String tag,
  }) async {
    try {
      final request = AccountModelRequest(name: name, tag: tag);

      final accountResult = await dataSource.getAccount(request);

      final puuid = accountResult.puuid;
      if (puuid == null) {
        throw Exception('Account not found for $name#$tag');
      }

      final regionResult = await dataSource.getSummonerRegion(puuid);

      if (regionResult.region == null) {
        throw Exception('Region not found for $name#$tag');
      }

      final summonerResult = await summonerDataSource.getSummonerByPUUID(
        GameMatchModelRequest(
          puuid: puuid,
          platform: RiotPlatform.values.firstWhere(
            (platform) => platform.name == regionResult.region,
            orElse: () => RiotPlatform.la1,
          ),
        ),
      );

      final account = AccountMapper.fromModels(
        accountModel: accountResult,
        summonerModel: summonerResult,
        regionModel: regionResult,
      );

      _sessionRepository.setAccount(account);

      return account.toSuccess();
    } catch (e) {
      print('Repository Impl: Error retrieving account: $e');
      return Exception('Failed to retrieve account: $e').toFailure();
    }
  }

  @override
  AsyncResult<List<Account>> getSavedAccounts() async {
    try {
      final models = await localDataSource.getSavedAccounts();

      if (models.isEmpty) {
        return const Success([]);
      }

      final accounts = <Account>[];
      for (final model in models) {
        final puuid = model.puuid;
        if (puuid == null) continue;

        final accountResult = await dataSource.getAccountByPUUID(puuid);
        if (accountResult.puuid == null) continue;

        final regionResult = await dataSource.getSummonerRegion(puuid);
        if (regionResult.region == null) continue;

        final summonerResult = await summonerDataSource.getSummonerByPUUID(
          GameMatchModelRequest(
            puuid: puuid,
            platform: RiotPlatform.values.firstWhere(
              (platform) => platform.name == regionResult.region,
              orElse: () => RiotPlatform.la1,
            ),
          ),
        );

        final account = AccountMapper.fromModels(
          accountModel: accountResult,
          summonerModel: summonerResult,
          regionModel: regionResult,
        );
        accounts.add(account);
      }

      return accounts.toSuccess();
    } catch (e) {
      print('Repository Impl: Error retrieving saved accounts: $e');
      return Exception('Failed to retrieve saved accounts: $e').toFailure();
    }
  }

  @override
  AsyncResult<Unit> saveAccount(Account account) async {
    try {
      final model = AccountMapper.toModel(account);
      await localDataSource.saveAccount(model);

      return unit.toSuccess();
    } catch (e) {
      print('Repository Impl: Error saving account: $e');
      return Exception('Failed to save account: $e').toFailure();
    }
  }
}
