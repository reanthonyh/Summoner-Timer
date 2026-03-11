import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:summoner_timer/domain/entities/riot_host.dart';

final class RiotDioClient {
  RiotDioClient._();

  static final Map<RiotHost, Dio> _clients = {};

  static Dio getClient(RiotHost host) {
    if (_clients.containsKey(host)) {
      return _clients[host]!;
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: host.url,
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
        logPrint: (obj) => print('DIO [${host.url}]: $obj'),
      ),
    );

    _clients[host] = dio;
    return dio;
  }
}
