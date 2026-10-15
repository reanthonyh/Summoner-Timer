import 'package:summoner_timer/domain/usecases/accounts/get_current_account_usecase.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GetCurrentAccountUseCase', () {
    late MockSessionRepository mockRepository;
    late GetCurrentAccountUseCase useCase;

    setUp(() {
      mockRepository = MockSessionRepository();
      useCase = GetCurrentAccountUseCase(repository: mockRepository);
    });

    test('returns current account when set', () {
      final account = createTestAccount(puuid: 'puuid-123', gameName: 'TestPlayer');

      mockRepository.whenCurrentAccount(account);

      final result = useCase();

      expect(result, equals(account));
    });

    test('returns null when no account set', () {
      mockRepository.whenCurrentAccount(null);

      final result = useCase();

      expect(result, isNull);
    });

    test('returns updated account after set', () {
      final account1 = createTestAccount(puuid: 'puuid-1', gameName: 'Player1');
      final account2 = createTestAccount(puuid: 'puuid-2', gameName: 'Player2');

      mockRepository.whenCurrentAccount(account1);
      expect(useCase(), equals(account1));

      mockRepository.whenCurrentAccount(account2);
      expect(useCase(), equals(account2));
    });
  });
}
