import 'package:get_it/get_it.dart';
import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
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
import 'package:summoner_timer/domain/usecases/get_summoner_spells_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Repositories
  getIt.registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl());

  // Data Sources
  getIt.registerLazySingleton<RiotAmericasApi>(
    () => RiotAmericasApi(sessionRepository: getIt<SessionRepository>()),
  );
  getIt.registerLazySingleton<DataDragonApi>(() => DataDragonApi());

  // Repositories
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      dataSource: getIt<RiotAmericasApi>(),
      sessionRepository: getIt<SessionRepository>(),
    ),
  );

  getIt.registerLazySingleton<SpectatorRepository>(
    () => SpectatorRepositoryImpl(
      dataSource: getIt<RiotAmericasApi>(),
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
}
