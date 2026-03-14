import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class RiotDioClient {
  RiotDioClient._();

  static final Dio _dio = _createDio();

  static Dio get client => _dio;

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        headers: {
          'X-Riot-Token': dotenv.env['RIOT_API_KEY'],
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print('Riot API: $obj'),
      ),
    );

    return dio;
  }
}
