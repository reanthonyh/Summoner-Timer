import 'package:summoner_timer/core/networking/dio_client.dart';
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
  }) : dataSource =
           dataSource ??
           RiotAmericasApi(client: RiotDioClient.getClient(RiotHost.americas)),
       _sessionRepository = sessionRepository;

  final RiotAmericasApi dataSource;
  final SessionRepository _sessionRepository;

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

      // Successfully retrieved the account, let's store it in our session
      _sessionRepository.setAccount(account);

      return account;
    } catch (e) {
      print('Repository Impl: Error retrieving account: $e');
      rethrow;
    }
  }
}
