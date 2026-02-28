import 'dart:async';

import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl()
    : dataSource = RiotAmericasApi(client: RiotDioClient().instance);

  final RiotAmericasApi dataSource;

  @override
  FutureOr<void> retrieveUserByNameTag({
    required String name,
    required String tag,
  }) async {
    final request = AccountModelRequest(name: name, tag: tag);

    final response = await dataSource.getAccount(request);

    print('Repository Impl: $response');
  }
}
