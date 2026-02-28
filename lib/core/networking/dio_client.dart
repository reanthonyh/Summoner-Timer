import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Represents the different Riot API regional and platform endpoints.
enum RiotHost {
  // Regional Hosts
  americas('https://americas.api.riotgames.com'),
  europe('https://europe.api.riotgames.com'),
  asia('https://asia.api.riotgames.com'),
  esports('https://esports.api.riotgames.com'),

  // Platform Hosts
  la1('https://la1.api.riotgames.com'),
  la2('https://la2.api.riotgames.com'),
  na1('https://na1.api.riotgames.com');

  const RiotHost(this.url);
  final String url;
}

/// A factory that manages and caches Dio instances for different Riot API hosts.
final class RiotDioClient {
  RiotDioClient._();

  static final Map<RiotHost, Dio> _clients = {};

  /// Returns a cached Dio instance for the specified [host].
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
