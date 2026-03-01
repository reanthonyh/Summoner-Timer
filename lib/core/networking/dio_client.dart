import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum RiotHost {
  americas('https://americas.api.riotgames.com'),
  europe('https://europe.api.riotgames.com'),
  asia('https://asia.api.riotgames.com'),

  // Platform Hosts
  la1('https://la1.api.riotgames.com'),
  la2('https://la2.api.riotgames.com'),
  na1('https://na1.api.riotgames.com'),
  euw1('https://euw1.api.riotgames.com');

  const RiotHost(this.url);
  final String url;
}

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
