import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/core/exceptions/exceptions.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

class MockSpectatorRepository extends Mock implements SpectatorRepository {}

class MockSummonerSpellsRepository extends Mock implements SummonerSpellsRepository {}

class MockSessionRepository extends Mock implements SessionRepository {}

extension MockAccountRepositoryExtensions on MockAccountRepository {
  void whenRetrieveSummonerByNameTag({
    required String name,
    required String tag,
    required AsyncResult<Account> result,
  }) {
    when(() => retrieveSummonerByNameTag(name: name, tag: tag))
        .thenAnswer((_) async => result);
  }

  void whenRetrieveSummonerByPUUID({
    required String puuid,
    required AsyncResult<Account> result,
  }) {
    when(() => retrieveSummonerByPUUID(puuid))
        .thenAnswer((_) async => result);
  }

  void whenGetSavedAccounts({required AsyncResult<List<Account>> result}) {
    when(() => getSavedAccounts()).thenAnswer((_) async => result);
  }

  void whenSaveAccount({required Account account, required AsyncResult<Unit> result}) {
    when(() => saveAccount(account)).thenAnswer((_) async => result);
  }
}

extension MockSpectatorRepositoryExtensions on MockSpectatorRepository {
  void whenFindOnGameMatch({required AsyncResultDart<GameInformation, ApiException> result}) {
    when(() => findOnGameMatch()).thenAnswer((_) async => result);
  }
}

extension MockSummonerSpellsRepositoryExtensions on MockSummonerSpellsRepository {
  void whenGetSummonerSpells({required AsyncResult<List<SummonerSpell>> result}) {
    when(() => getSummonerSpells()).thenAnswer((_) async => result);
  }
}

extension MockSessionRepositoryExtensions on MockSessionRepository {
  void whenCurrentAccount(Account? account) {
    when(() => currentAccount).thenReturn(account);
  }

  void whenPlatformHost(RiotPlatform platform) {
    when(() => platformHost).thenReturn(platform);
  }

  void whenRegionalHost(RiotRegion region) {
    when(() => regionalHost).thenReturn(region);
  }

  void whenSetAccount(Account account) {
    when(() => setAccount(account)).thenReturn(null);
  }

  void whenClear() {
    when(() => clear()).thenReturn(null);
  }
}