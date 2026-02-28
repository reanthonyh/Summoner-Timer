import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late GetAccountUseCase useCase;
  late MockAccountRepository mockRepository;

  setUp(() {
    mockRepository = MockAccountRepository();
    useCase = GetAccountUseCase(repository: mockRepository);
  });

  group('GetAccountUseCase', () {
    const testName = 'TestName';
    const testTag = 'TEST';

    final testAccount = Account(
      puuid: 'test-puuid-123',
      gameName: 'TestGameName',
      tagLine: 'TEST',
    );

    test('returns Account when repository call is successful', () async {
      when(
        () => mockRepository.retrieveUserByNameTag(name: testName, tag: testTag),
      ).thenAnswer((_) async => testAccount);

      final result = await useCase(name: testName, tag: testTag);

      expect(result.puuid, equals('test-puuid-123'));
      expect(result.gameName, equals('TestGameName'));
      expect(result.tagLine, equals('TEST'));
    });
  });
}
