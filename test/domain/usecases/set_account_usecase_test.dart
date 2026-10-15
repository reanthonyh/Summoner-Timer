import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/domain/usecases/accounts/set_account_usecase.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('SetAccountUseCase', () {
    late MockSessionRepository mockRepository;
    late SetAccountUseCase useCase;

    setUp(() {
      mockRepository = MockSessionRepository();
      useCase = SetAccountUseCase(repository: mockRepository);
    });

    test('sets account in session repository', () {
      final account = createTestAccount(puuid: 'puuid-123', gameName: 'TestPlayer');

      mockRepository.whenSetAccount(account);

      useCase(account);

      verify(() => mockRepository.setAccount(account)).called(1);
    });

    test('can be called multiple times with different accounts', () {
      final account1 = createTestAccount(puuid: 'puuid-1', gameName: 'Player1');
      final account2 = createTestAccount(puuid: 'puuid-2', gameName: 'Player2');

      mockRepository.whenSetAccount(account1);
      mockRepository.whenSetAccount(account2);

      useCase(account1);
      useCase(account2);

      verify(() => mockRepository.setAccount(account1)).called(1);
      verify(() => mockRepository.setAccount(account2)).called(1);
    });
  });
}
