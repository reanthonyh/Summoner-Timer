import 'package:dio/dio.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';

import '../models/models.dart';

final class DataDragonApi {
  DataDragonApi() : _client = Dio(BaseOptions(baseUrl: DataDragonURL.dataDragonBaseUrl));

  final Dio _client;

  String getFullImageUrl(String fullName) =>
      '${DataDragonURL.dataDragonBaseUrl}/img/spell/$fullName';
  String getSpriteUrl(String spriteName) =>
      '${DataDragonURL.dataDragonBaseUrl}/img/sprite/$spriteName';
  String getProfileIconUrl(int profileIconId) =>
      '${DataDragonURL.dataDragonBaseUrl}/img/profileicon/$profileIconId.png';

  Future<SummonerSpellsModelResponse> getSummonerSpells() async {
    final url = '${DataDragonURL.dataDragonBaseUrl}/data/en_US/summoner.json';

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
