import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class RiotDioClient {
  RiotDioClient._internal()
    : _dioInstance = Dio(
        BaseOptions(
          baseUrl: 'https://americas.api.riotgames.com',
          headers: {'X-Riot-Token': dotenv.env['RIOT_API_KEY']},
        ),
      ) {
    _dioInstance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print('DIO: $obj'),
      ),
    );
  }

  factory RiotDioClient() => _instance;

  static final RiotDioClient _instance = RiotDioClient._internal();

  final Dio _dioInstance;

  Dio get instance => _dioInstance;
}
