import 'package:dio/dio.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';

import '../models/models.dart';

final class DataDragonApi {
  DataDragonApi() : _client = Dio(BaseOptions(baseUrl: ApiConstants.dataDragonBaseUrl));

  final Dio _client;

  String getFullImageUrl(String fullName) => '${ApiConstants.dataDragonBaseUrl}/img/spell/$fullName';
  String getSpriteUrl(String spriteName) => '${ApiConstants.dataDragonBaseUrl}/img/sprite/$spriteName';

  Future<SummonerSpellsModelResponse> getSummonerSpells() async {
    final url = '${ApiConstants.dataDragonBaseUrl}/data/en_US/summoner.json';

    print('DataDragonSummonerSpellsApi - Request: GET $url');

    final response = await _client.get(url);

    try {
      print('DataDragonSummonerSpellsApi - Response status: ${response.statusCode}');
      print('DataDragonSummonerSpellsApi - Response : ${response.data}');

      return SummonerSpellsModelResponse.fromJson(response.data);
    } catch (err) {
      print('DataDragonSummonerSpellsApi - Parse error: $err');
      throw Exception('Error parsing json response from DataDragon summoner.json');
    }
  }
}
