import 'package:dio/dio.dart';
import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

import '../models/models.dart';

final class RiotAmericasApi {
  RiotAmericasApi({required SessionRepository sessionRepository})
    : _sessionRepository = sessionRepository;

  final SessionRepository _sessionRepository;

  Dio get _regionalClient => RiotDioClient.getClient(_sessionRepository.regionalHost);

  Dio get _platformClient => RiotDioClient.getClient(_sessionRepository.platformHost);

  Future<AccountModelResponse> getAccount(AccountModelRequest request) async {
    final AccountModelRequest(:name, :tag) = request;
    final url = '/riot/account/v1/accounts/by-riot-id/$name/$tag';

    print('RiotAmericasApi - Request: GET $url (Regional)');
    print('RiotAmericasApi - Request headers: ${_regionalClient.options.headers}');

    final response = await _regionalClient.get(url);

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
    final url = '/riot/account/v1/accounts/by-puuid/$puuid';

    print('RiotAmericasApi - Request GET $url (Regional)');
    print('RiotAmericasApi - Request header: ${_regionalClient.options.headers}');

    final response = await _regionalClient.get(url);

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
    final url = '/riot/account/v1/region/by-game/lol/by-puuid/$puuid';

    print('RiotAmericasApi - Request GET $url (Regional)');
    print('RiotAmericasApi - Request header: ${_regionalClient.options.headers}');

    final response = await _regionalClient.get(url);

    try {
      print('RiotAmericasApi - Response status: ${response.statusCode}');
      print('RiotAmericasApi - Response data: ${response.data}');

      return RegionModelResponse.fromJson(response.data);
    } catch (err) {
      print('RiotAmericasApi - Parse error: $err');
      throw Exception('Error parsing json response from Riot Account-V1');
    }
  }

  Future<GameMatchModelResponse> getMatchInformation(String puuid) async {
    final url = '/lol/spectator/v5/active-games/by-summoner/$puuid';

    print('RiotAmericasApi - Request GET $url (Platform)');
    print('RiotAmericasApi - Request header: ${_platformClient.options.headers}');

    final response = await _platformClient.get(url);

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
