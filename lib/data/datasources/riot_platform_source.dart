import 'package:summoner_timer/core/networking/riot_dio_client.dart';

import '../models/models.dart';

final class RiotPlatformSource {
  RiotPlatformSource();

  final _dio = RiotDioClient.client;

  Future<SummonerModelResponse> getSummonerByPUUID(GameMatchModelRequest request) async {
    final GameMatchModelRequest(:puuid, :platform) = request;
    final url = '${platform.url}/lol/summoner/v4/summoners/by-puuid/$puuid';

    print('RiotSummonerApi - Request: GET $url');
    print('RiotSummonerApi - Request headers: ${RiotDioClient.client.options.headers}');

    final response = await RiotDioClient.client.get(url);

    try {
      print('RiotSummonerApi - Response status: ${response.statusCode}');
      print('RiotSummonerApi - Response data: ${response.data}');

      return SummonerModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotSummonerApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Summoner-V4');
    }
  }

  Future<GameMatchModelResponse> getMatchInformation(
    GameMatchModelRequest request,
  ) async {
    final GameMatchModelRequest(:puuid, :platform) = request;
    final url = '${platform.url}/lol/spectator/v5/active-games/by-summoner/$puuid';

    print('RiotAmericasApi - Request GET $url');
    print('RiotAmericasApi - Request header: ${_dio.options.headers}');

    final response = await _dio.get(url);

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return GameMatchModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Spectator-V5');
    }
  }
}
