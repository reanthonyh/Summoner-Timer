import 'package:get_it/get_it.dart';

import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/local_account_datasource.dart';
import 'package:summoner_timer/data/datasources/riot_region_source.dart';
import 'package:summoner_timer/data/datasources/riot_platform_source.dart';
import 'package:summoner_timer/data/repositories/data_repositories.dart';
import 'package:summoner_timer/domain/repositories/repositories.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core / Session (no dependencies)
  getIt.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl());

  // Data Sources
  // Local
  getIt.registerLazySingleton<LocalAccountDataSource>(() => LocalAccountDataSourceImpl());

  // Remote - Riot APIs
  getIt.registerLazySingleton<RiotRegionSource>(() => RiotRegionSource());
  getIt.registerLazySingleton<RiotPlatformSource>(() => RiotPlatformSource());

  // Remote - Data Dragon (League static data)
  getIt.registerLazySingleton<DataDragonApi>(() => DataDragonApi());

  // Repositories
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      dataSource: getIt<RiotRegionSource>(),
      localDataSource: getIt<LocalAccountDataSource>(),
      summonerDataSource: getIt<RiotPlatformSource>(),
      sessionRepository: getIt<SessionRepository>(),
    ),
  );

  getIt.registerLazySingleton<SummonerSpellsRepository>(
    () => SummonerSpellsRepositoryImpl(dataSource: getIt<DataDragonApi>()),
  );

  getIt.registerLazySingleton<SpectatorRepository>(
    () => SpectatorRepositoryImpl(
      riotApi: getIt<RiotRegionSource>(),
      riotPlatformSource: getIt<RiotPlatformSource>(),
      summonerSpellsRepository: getIt<SummonerSpellsRepository>(),
      sessionRepository: getIt<SessionRepository>(),
    ),
  );

  // Use Cases
  // Account
  getIt.registerFactory<GetAccountUseCase>(
    () => GetAccountUseCase(repository: getIt<AccountRepository>()),
  );
  getIt.registerFactory<GetCurrentAccountUseCase>(
    () => GetCurrentAccountUseCase(repository: getIt<SessionRepository>()),
  );
  getIt.registerFactory<GetSavedAccountsUseCase>(
    () => GetSavedAccountsUseCase(repository: getIt<AccountRepository>()),
  );
  getIt.registerFactory<SaveAccountUseCase>(
    () => SaveAccountUseCase(repository: getIt<AccountRepository>()),
  );
  getIt.registerFactory<SetAccountUseCase>(
    () => SetAccountUseCase(repository: getIt<SessionRepository>()),
  );

  // Game Match
  getIt.registerFactory<GetCurrentGameUseCase>(
    () => GetCurrentGameUseCase(repository: getIt<SpectatorRepository>()),
  );

  // Summoner Spells
  getIt.registerFactory<GetSummonerSpellsUseCase>(
    () => GetSummonerSpellsUseCase(repository: getIt<SummonerSpellsRepository>()),
  );
}
