import 'package:dio/dio.dart';

import '../models/models.dart';

class RiotAmericasApi {
  RiotAmericasApi({required this.client});

  final Dio client;

  Future<AccountModelResponse> getAccount(AccountModelRequest request) async {
    final AccountModelRequest(:name, :tag) = request;

    print(
      'RiotAmericasApi - Request: GET /riot/account/v1/accounts/by-riot-id/$name/$tag',
    );
    print('RiotAmericasApi - Request headers: ${client.options.headers}');

    final response = await client.get('/riot/account/v1/accounts/by-riot-id/$name/$tag');

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return AccountModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }
}
