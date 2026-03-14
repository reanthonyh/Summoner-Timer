import 'package:dio/dio.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/core/networking/riot_dio_client.dart';

import '../models/models.dart';

final class RiotRegionSource {
  RiotRegionSource();

  final Dio _dio = RiotDioClient.client;

  Future<AccountModelResponse> getAccount(AccountModelRequest request) async {
    final AccountModelRequest(:name, :tag) = request;

    final url =
        '${RiotRegion.americas.url}/riot/account/v1/accounts/by-riot-id/$name/$tag';

    print('RiotAmericasApi - Request: GET $url');
    print('RiotAmericasApi - Request headers: ${_dio.options.headers}');

    final response = await _dio.get(url);

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return AccountModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }

  Future<AccountModelResponse> getAccountByPUUID(String puuid) async {
    final url = '${RiotRegion.americas.url}/riot/account/v1/accounts/by-puuid/$puuid';

    print('RiotAmericasApi - Request GET $url');
    print('RiotAmericasApi - Request header: ${_dio.options.headers}');

    final response = await _dio.get(url);

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return AccountModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }

  Future<RegionModelResponse> getSummonerRegion(String puuid) async {
    const defaultGame = 'lol';
    final url =
        '${RiotRegion.americas.url}/riot/account/v1/region/by-game/$defaultGame/by-puuid/$puuid';

    print('RiotAmericasApi - Request GET $url');
    print('RiotAmericasApi - Request header: ${_dio.options.headers}');

    final response = await _dio.get(url);

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return RegionModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }
}
