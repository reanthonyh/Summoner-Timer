import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/usecases/accounts/get_saved_accounts_usecase.dart';
import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GetSavedAccountsUseCase', () {
    late MockAccountRepository mockRepository;
    late GetSavedAccountsUseCase useCase;

    setUp(() {
      mockRepository = MockAccountRepository();
      useCase = GetSavedAccountsUseCase(repository: mockRepository);
    });

    test('returns empty list when no saved accounts', () async {
      mockRepository.whenGetSavedAccounts(
        result: Future.value(<Account>[].toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull(), isEmpty);
    });

    test('returns list of saved accounts', () async {
      final accounts = [
        createTestAccount(puuid: 'puuid-1', gameName: 'Player1'),
        createTestAccount(puuid: 'puuid-2', gameName: 'Player2'),
        createTestAccount(puuid: 'puuid-3', gameName: 'Player3'),
      ];

      mockRepository.whenGetSavedAccounts(
        result: Future.value(accounts.toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.length, 3);
      expect(result.getOrNull()![0].gameName, 'Player1');
      expect(result.getOrNull()![2].gameName, 'Player3');
    });

    test('returns failure when repository returns error', () async {
      mockRepository.whenGetSavedAccounts(
        result: Future.value(Exception('Failed to retrieve saved accounts').toFailure()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isFalse);
    });
  });
}