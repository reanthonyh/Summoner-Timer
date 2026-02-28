import 'dart:async';

import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({RiotAmericasApi? dataSource})
    : dataSource = dataSource ?? RiotAmericasApi(client: RiotDioClient().instance);

  final RiotAmericasApi dataSource;

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

      print('Repository Impl: $accountResponse');
      print('Repository Impl: $regionResponse');

      return Account(
        puuid: accountResponse.puuid ?? '',
        gameName: accountResponse.gameName ?? '',
        tagLine: accountResponse.tagLine ?? '',
        region: Region.values.firstWhere(
          (element) => element.code == regionResponse.region,
          orElse: () => Region.lan,
        ),
      );
    } catch (e) {
      print('Repository Impl: Error retrieving account: $e');
      rethrow;
    }
  }
}
