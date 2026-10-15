import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/usecases/accounts/save_account_usecase.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('SaveAccountUseCase', () {
    late MockAccountRepository mockRepository;
    late SaveAccountUseCase useCase;

    setUp(() {
      mockRepository = MockAccountRepository();
      useCase = SaveAccountUseCase(repository: mockRepository);
    });

    test('returns success when account saved', () async {
      final account = createTestAccount(puuid: 'puuid-123', gameName: 'TestPlayer');

      mockRepository.whenSaveAccount(
        account: account,
        result: Future.value(unit.toSuccess()),
      );

      final result = await useCase(account);

      expect(result.isSuccess(), isTrue);
    });

    test('returns failure when repository returns error', () async {
      final account = createTestAccount(puuid: 'puuid-123');

      mockRepository.whenSaveAccount(
        account: account,
        result: Future.value(Exception('Failed to save account').toFailure()),
      );

      final result = await useCase(account);

      expect(result.isSuccess(), isFalse);
    });

    test('calls repository with correct account', () async {
      final account = createTestAccount(
        puuid: 'specific-puuid',
        gameName: 'SpecificName',
        tagLine: 'TAG',
      );

      mockRepository.whenSaveAccount(
        account: account,
        result: Future.value(unit.toSuccess()),
      );

      await useCase(account);

      verify(() => mockRepository.saveAccount(account)).called(1);
    });
  });
}
