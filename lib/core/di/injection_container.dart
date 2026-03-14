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
  // Persistence
  getIt.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl());
  getIt.registerLazySingleton<LocalAccountDataSource>(() => LocalAccountDataSourceImpl());

  // Data Sources
  getIt.registerLazySingleton<RiotRegionSource>(() => RiotRegionSource());
  getIt.registerLazySingleton<RiotPlatformSource>(() => RiotPlatformSource());
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
  getIt.registerFactory<GetAccountUseCase>(
    () => GetAccountUseCase(repository: getIt<AccountRepository>()),
  );

  getIt.registerFactory<GetCurrentGameUseCase>(
    () => GetCurrentGameUseCase(repository: getIt<SpectatorRepository>()),
  );

  getIt.registerFactory<GetSummonerSpellsUseCase>(
    () => GetSummonerSpellsUseCase(repository: getIt<SummonerSpellsRepository>()),
  );

  getIt.registerFactory<SetAccountUseCase>(
    () => SetAccountUseCase(repository: getIt<SessionRepository>()),
  );

  getIt.registerFactory<GetSavedAccountsUseCase>(
    () => GetSavedAccountsUseCase(repository: getIt<AccountRepository>()),
  );

  getIt.registerFactory<SaveAccountUseCase>(
    () => SaveAccountUseCase(repository: getIt<AccountRepository>()),
  );
}
