import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/usecases/accounts/get_account_usecase.dart';
import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GetAccountUseCase', () {
    late MockAccountRepository mockRepository;
    late GetAccountUseCase useCase;

    setUp(() {
      mockRepository = MockAccountRepository();
      useCase = GetAccountUseCase(repository: mockRepository);
    });

    test('returns account when searching by riotId', () async {
      const name = 'TestSummoner';
      const tag = 'NA1';
      final expectedAccount = createTestAccount(gameName: name, tagLine: tag);

      mockRepository.whenRetrieveSummonerByNameTag(
        name: name,
        tag: tag,
        result: Future.value(expectedAccount.toSuccess()),
      );

      final result = await useCase(riotId: (name: name, tag: tag));

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.riotID, 'TestSummoner#NA1');
    });

    test('returns account when searching by puuid', () async {
      const puuid = 'test-puuid-123';
      final expectedAccount = createTestAccount(puuid: puuid);

      mockRepository.whenRetrieveSummonerByPUUID(
        puuid: puuid,
        result: Future.value(expectedAccount.toSuccess()),
      );

      final result = await useCase(puuid: puuid);

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.puuid, puuid);
    });

    test('returns failure when neither riotId nor puuid provided', () async {
      final result = await useCase();

      expect(result.isSuccess(), isFalse);
      expect(result.exceptionOrNull()!.toString(), contains('Either riotId or puuid must be provided'));
    });

    test('returns failure when repository returns error for riotId', () async {
      const name = 'NonExistent';
      const tag = 'NA1';

      mockRepository.whenRetrieveSummonerByNameTag(
        name: name,
        tag: tag,
        result: Future.value(Exception('Account not found').toFailure()),
      );

      final result = await useCase(riotId: (name: name, tag: tag));

      expect(result.isSuccess(), isFalse);
    });

    test('returns failure when repository returns error for puuid', () async {
      const puuid = 'invalid-puuid';

      mockRepository.whenRetrieveSummonerByPUUID(
        puuid: puuid,
        result: Future.value(Exception('Account not found').toFailure()),
      );

      final result = await useCase(puuid: puuid);

      expect(result.isSuccess(), isFalse);
    });

    test('prioritizes puuid over riotId when both provided', () async {
      const name = 'TestSummoner';
      const tag = 'NA1';
      const puuid = 'test-puuid-123';
      final expectedAccount = createTestAccount(puuid: puuid, gameName: name, tagLine: tag);

      mockRepository.whenRetrieveSummonerByPUUID(
        puuid: puuid,
        result: Future.value(expectedAccount.toSuccess()),
      );

      final result = await useCase(riotId: (name: name, tag: tag), puuid: puuid);

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.puuid, puuid);
      verifyNever(() => mockRepository.retrieveSummonerByNameTag(name: name, tag: tag));
    });
  });
}