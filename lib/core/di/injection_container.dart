import 'package:get_it/get_it.dart';
import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/local_account_datasource.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/datasources/riot_summoner_api.dart';
import 'package:summoner_timer/data/repositories/account_repository_impl.dart';
import 'package:summoner_timer/data/repositories/session_repository_impl.dart';
import 'package:summoner_timer/data/repositories/spectator_repository_impl.dart';
import 'package:summoner_timer/data/repositories/summoner_spells_repository_impl.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';
import 'package:summoner_timer/domain/usecases/get_saved_accounts_usecase.dart';
import 'package:summoner_timer/domain/usecases/get_summoner_spells_usecase.dart';
import 'package:summoner_timer/domain/usecases/save_account_usecase.dart';
import 'package:summoner_timer/domain/usecases/set_account_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Persistence
  getIt.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl());
  getIt.registerLazySingleton<LocalAccountDataSource>(() => LocalAccountDataSourceImpl());

  // Data Sources
  getIt.registerLazySingleton<RiotAmericasApi>(
    () => RiotAmericasApi(sessionRepository: getIt<SessionRepository>()),
  );
  getIt.registerLazySingleton<RiotSummonerApi>(
    () => RiotSummonerApi(sessionRepository: getIt<SessionRepository>()),
  );
  getIt.registerLazySingleton<DataDragonApi>(() => DataDragonApi());

  // Repositories
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      dataSource: getIt<RiotAmericasApi>(),
      localDataSource: getIt<LocalAccountDataSource>(),
      summonerDataSource: getIt<RiotSummonerApi>(),
      sessionRepository: getIt<SessionRepository>(),
    ),
  );

  getIt.registerLazySingleton<SpectatorRepository>(
    () => SpectatorRepositoryImpl(
      dataSource: getIt<RiotAmericasApi>(),
      dataDragonDataSource: getIt<DataDragonApi>(),
      sessionRepository: getIt<SessionRepository>(),
    ),
  );

  getIt.registerLazySingleton<SummonerSpellsRepository>(
    () => SummonerSpellsRepositoryImpl(dataSource: getIt<DataDragonApi>()),
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
