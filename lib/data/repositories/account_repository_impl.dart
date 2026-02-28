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
  Future<Account> retrieveUserByNameTag({
    required String name,
    required String tag,
  }) async {
    final request = AccountModelRequest(name: name, tag: tag);

    final response = await dataSource.getAccount(request);

    print('Repository Impl: $response');

    return Account(
      puuid: response.puuid ?? '',
      gameName: response.gameName ?? '',
      tagLine: response.tagLine ?? '',
    );
  }
}
