import 'package:dio/dio.dart';

import '../models/models.dart';

final class RiotAmericasApi {
  RiotAmericasApi({required this.client});

  final Dio client;

  Future<AccountModelResponse> getAccount(AccountModelRequest request) async {
    final AccountModelRequest(:name, :tag) = request;

    final response = await client.get('/riot/account/v1/accounts/by-riot-id/$name/$tag');

    try {
      print('RiotAmericasApi - getAccount: $response');

      return AccountModelResponse.fromJson(response.data);
    } catch (err) {
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }
}
