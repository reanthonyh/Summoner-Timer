import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late GetAccountUseCase useCase;
  late MockAccountRepository mockRepository;

  setUp(() {
    mockRepository = MockAccountRepository();
    useCase = GetAccountUseCase(repository: mockRepository);
  });

  group('GetAccountUseCase', () {
    const testPuuid = 'test-puuid-123';
    const testName = 'TestPlayer';
    const testTag = 'NA1';
    const testRegion = Region.na;

    final testAccount = const Account(
      puuid: testPuuid,
      gameName: testName,
      tagLine: testTag,
      region: testRegion,
    );

    test('returns account when puuid is provided and repository succeeds', () async {
      when(
        () => mockRepository.retrieveSummonerByPUUID(testPuuid),
      ).thenAnswer((_) async => Result.success(testAccount));

      final result = await useCase(puuid: testPuuid);

      expect(result, isA<Result<Account, Exception>>());
      result.when(
        success: (account) {
          expect(account.puuid, testPuuid);
          expect(account.gameName, testName);
        },
        failure: (_) => fail('Expected success'),
      );
      verify(() => mockRepository.retrieveSummonerByPUUID(testPuuid)).called(1);
      verifyNever(
        () => mockRepository.retrieveSummonerByNameTag(
          name: any(named: 'name'),
          tag: any(named: 'tag'),
        ),
      );
    });

    test('returns account when riotId is provided and repository succeeds', () async {
      when(
        () => mockRepository.retrieveSummonerByNameTag(name: testName, tag: testTag),
      ).thenAnswer((_) async => Result.success(testAccount));

      final result = await useCase(riotId: (name: testName, tag: testTag));

      expect(result, isA<Result<Account, Exception>>());
      result.when(
        success: (account) {
          expect(account.puuid, testPuuid);
          expect(account.gameName, testName);
        },
        failure: (_) => fail('Expected success'),
      );
      verify(
        () => mockRepository.retrieveSummonerByNameTag(name: testName, tag: testTag),
      ).called(1);
    });

    test('returns failure when neither puuid nor riotId is provided', () async {
      final result = await useCase();

      expect(result, isA<Result<Account, Exception>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error.toString(), contains('Either riotId or puuid must be provided'));
        },
      );
      verifyNever(() => mockRepository.retrieveSummonerByPUUID(any()));
      verifyNever(
        () => mockRepository.retrieveSummonerByNameTag(
          name: any(named: 'name'),
          tag: any(named: 'tag'),
        ),
      );
    });

    test('returns failure when repository fails with puuid', () async {
      final exception = Exception('Network error');
      when(
        () => mockRepository.retrieveSummonerByPUUID(testPuuid),
      ).thenAnswer((_) async => Result.failure(exception));

      final result = await useCase(puuid: testPuuid);

      expect(result, isA<Result<Account, Exception>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error.toString(), contains('Network error'));
        },
      );
    });

    test('prefers puuid over riotId when both are provided', () async {
      when(
        () => mockRepository.retrieveSummonerByPUUID(testPuuid),
      ).thenAnswer((_) async => Result.success(testAccount));

      await useCase(puuid: testPuuid, riotId: (name: testName, tag: testTag));

      verify(() => mockRepository.retrieveSummonerByPUUID(testPuuid)).called(1);
      verifyNever(
        () => mockRepository.retrieveSummonerByNameTag(
          name: any(named: 'name'),
          tag: any(named: 'tag'),
        ),
      );
    });
  });
}
