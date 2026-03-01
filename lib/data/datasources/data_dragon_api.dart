import 'package:dio/dio.dart';

import '../models/models.dart';

final class DataDragonApi {
  DataDragonApi() : _client = Dio(BaseOptions(baseUrl: _baseUrl));

  final Dio _client;

  static const String _baseUrl = 'https://ddragon.leagueoflegends.com/cdn/16.4.1';

  Future<SummonerSpellsModelResponse> getSummonerSpells() async {
    final url = '$_baseUrl/data/en_US/summoner.json';

    print('DataDragonSummonerSpellsApi - Request: GET $url');

    final response = await _client.get(url);

    try {
      print('DataDragonSummonerSpellsApi - Response status: ${response.statusCode}');

      return SummonerSpellsModelResponse.fromJson(response.data);
    } catch (err) {
      print('DataDragonSummonerSpellsApi - Parse error: $err');
      throw Exception('Error parsing json response from DataDragon summoner.json');
    }
  }
}
