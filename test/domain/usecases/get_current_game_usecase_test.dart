import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/core/exceptions/exceptions.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/usecases/game_match/get_current_game_usecase.dart';
import 'package:test/test.dart';

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GetCurrentGameUseCase', () {
    late MockSpectatorRepository mockRepository;
    late GetCurrentGameUseCase useCase;

    setUp(() {
      mockRepository = MockSpectatorRepository();
      useCase = GetCurrentGameUseCase(repository: mockRepository);
    });

    test('returns game information on success', () async {
      final spellOne = createTestSummonerSpell(
        id: '4',
        name: 'Flash',
        cooldownSeconds: 300,
      );
      final spellTwo = createTestSummonerSpell(
        id: '14',
        name: 'Ignite',
        cooldownSeconds: 180,
      );

      final participant = createTestGameParticipant(
        puuid: 'player-puuid',
        spellOne: spellOne,
        spellTwo: spellTwo,
        riotId: 'TestPlayer#NA1',
        team: Team.ally,
      );

      final expectedGameInfo = createTestGameInformation(
        matchId: 'match-123',
        players: [participant],
      );

      mockRepository.whenFindOnGameMatch(
        result: Future.value(expectedGameInfo.toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.matchId, 'match-123');
      expect(result.getOrNull()!.players.length, 1);
    });

    test('returns ApiException when no active game found (404)', () async {
      mockRepository.whenFindOnGameMatch(
        result: Future.value(
          ApiException(message: 'No active game found', statusCode: 404).toFailure(),
        ),
      );

      final result = await useCase();

      expect(result.isSuccess(), isFalse);
      final exception = result.exceptionOrNull() as ApiException;
      expect(exception.statusCode, 404);
      expect(exception.message, 'No active game found');
    });

    test('returns ApiException on network error', () async {
      mockRepository.whenFindOnGameMatch(
        result: Future.value(
          ApiException(
            message: 'Network error occurred',
            statusCode: 500,
            responseBody: 'Internal Server Error',
          ).toFailure(),
        ),
      );

      final result = await useCase();

      expect(result.isSuccess(), isFalse);
      final exception = result.exceptionOrNull() as ApiException;
      expect(exception.statusCode, 500);
      expect(exception.message, 'Network error occurred');
    });

    test('returns ApiException on unexpected error', () async {
      mockRepository.whenFindOnGameMatch(
        result: Future.value(
          ApiException(message: 'An unexpected error occurred').toFailure(),
        ),
      );

      final result = await useCase();

      expect(result.isSuccess(), isFalse);
      final exception = result.exceptionOrNull() as ApiException;
      expect(exception.message, 'An unexpected error occurred');
    });
  });
}
