import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A factory that manages and caches Dio instances for different Riot API hosts.
///
/// Implements the Flyweight/Registry pattern to avoid recreating expensive
/// Dio instances when switching between regional and platform-specific endpoints.
final class RiotDioClient {
  RiotDioClient._();

  static final Map<String, Dio> _clients = {};

  /// Returns a cached Dio instance for the specified [baseUrl].
  /// If no instance exists for that host, a new one is created.
  static Dio getClient(String baseUrl) {
    if (_clients.containsKey(baseUrl)) {
      return _clients[baseUrl]!;
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
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
        logPrint: (obj) => print('DIO [$baseUrl]: $obj'),
      ),
    );

    _clients[baseUrl] = dio;
    return dio;
  }
}
