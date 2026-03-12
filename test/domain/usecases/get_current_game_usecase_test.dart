import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/spectator_repository.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';

class MockSpectatorRepository extends Mock implements SpectatorRepository {}

void main() {
  late GetCurrentGameUseCase useCase;
  late MockSpectatorRepository mockRepository;

  setUp(() {
    mockRepository = MockSpectatorRepository();
    useCase = GetCurrentGameUseCase(repository: mockRepository);
  });

  group('GetCurrentGameUseCase', () {
    final testGameInfo = GameInformation(
      matchId: 'game-123',
      players: [
        GameParticipant(
          puuid: 'puuid-1',
          riotId: 'Player1#NA1',
          team: Team.ally,
          championId: 1,
          spellOne: const SummonerSpell(
            id: 'SummonerBarrier',
            name: 'Barrier',
            cooldownSeconds: 180,
            spriteUrl: '',
            imageUrl: '',
          ),
          spellTwo: const SummonerSpell(
            id: 'SummonerFlash',
            name: 'Flash',
            cooldownSeconds: 300,
            spriteUrl: '',
            imageUrl: '',
          ),
        ),
      ],
    );

    test('returns game information when repository succeeds', () async {
      when(
        () => mockRepository.findOnGameMatch(),
      ).thenAnswer((_) async => Result.success(testGameInfo));

      final result = await useCase();

      expect(result, isA<Result<GameInformation, Exception>>());
      result.when(
        success: (gameInfo) {
          expect(gameInfo.matchId, 'game-123');
          expect(gameInfo.players.length, 1);
        },
        failure: (_) => fail('Expected success'),
      );
      verify(() => mockRepository.findOnGameMatch()).called(1);
    });

    test('returns failure when repository fails', () async {
      final exception = Exception('No active game');
      when(
        () => mockRepository.findOnGameMatch(),
      ).thenAnswer((_) async => Result.failure(exception));

      final result = await useCase();

      expect(result, isA<Result<GameInformation, Exception>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error.toString(), contains('No active game'));
        },
      );
    });

    test('returns failure when player is not in game', () async {
      final exception = Exception('Player not in game');
      when(
        () => mockRepository.findOnGameMatch(),
      ).thenAnswer((_) async => Result.failure(exception));

      final result = await useCase();

      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error.toString(), contains('Player not in game'));
        },
      );
    });
  });
}
