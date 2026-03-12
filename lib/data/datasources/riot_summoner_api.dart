import 'package:dio/dio.dart';
import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

import '../models/models.dart';

final class RiotSummonerApi {
  RiotSummonerApi({required SessionRepository sessionRepository})
    : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Dio get _platformClient => RiotDioClient.getClient(_sessionRepository.platformHost);

  Future<SummonerModelResponse> getSummonerByPUUID(String puuid) async {
    final url = '/lol/summoner/v4/summoners/by-puuid/$puuid';

    print('RiotSummonerApi - Request: GET $url (Platform)');
    print('RiotSummonerApi - Request headers: ${_platformClient.options.headers}');

    final response = await _platformClient.get(url);

    try {
      print('RiotSummonerApi - Response status: ${response.statusCode}');
      print('RiotSummonerApi - Response data: ${response.data}');

      return SummonerModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotSummonerApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Summoner-V4');
    }
  }
}
