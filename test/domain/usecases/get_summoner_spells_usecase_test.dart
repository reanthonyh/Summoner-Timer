import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';
import 'package:summoner_timer/domain/usecases/get_summoner_spells_usecase.dart';

class MockSummonerSpellsRepository extends Mock implements SummonerSpellsRepository {}

void main() {
  late GetSummonerSpellsUseCase useCase;
  late MockSummonerSpellsRepository mockRepository;

  setUp(() {
    mockRepository = MockSummonerSpellsRepository();
    useCase = GetSummonerSpellsUseCase(repository: mockRepository);
  });

  group('GetSummonerSpellsUseCase', () {
    final testSpells = [
      const SummonerSpell(
        id: 'SummonerBarrier',
        name: 'Barrier',
        cooldownSeconds: 180,
        spriteUrl: 'https://example.com/barrier.png',
        imageUrl: 'https://example.com/barrier.png',
        modes: ['CLASSIC', 'ARAM'],
      ),
      const SummonerSpell(
        id: 'SummonerFlash',
        name: 'Flash',
        cooldownSeconds: 300,
        spriteUrl: 'https://example.com/flash.png',
        imageUrl: 'https://example.com/flash.png',
        modes: ['CLASSIC'],
      ),
      const SummonerSpell(
        id: 'SummonerIgnite',
        name: 'Ignite',
        cooldownSeconds: 180,
        spriteUrl: 'https://example.com/ignite.png',
        imageUrl: 'https://example.com/ignite.png',
        modes: ['CLASSIC', 'ARAM'],
      ),
    ];

    test('returns list of summoner spells when repository succeeds', () async {
      when(
        () => mockRepository.getSummonerSpells(),
      ).thenAnswer((_) async => Result.success(testSpells));

      final result = await useCase();

      expect(result, isA<Result<List<SummonerSpell>, Exception>>());
      result.when(
        success: (spells) {
          expect(spells.length, 3);
          expect(spells[0].id, 'SummonerBarrier');
          expect(spells[1].id, 'SummonerFlash');
          expect(spells[2].id, 'SummonerIgnite');
        },
        failure: (_) => fail('Expected success'),
      );
      verify(() => mockRepository.getSummonerSpells()).called(1);
    });

    test('returns failure when repository fails', () async {
      final exception = Exception('Failed to load spells');
      when(
        () => mockRepository.getSummonerSpells(),
      ).thenAnswer((_) async => Result.failure(exception));

      final result = await useCase();

      expect(result, isA<Result<List<SummonerSpell>, Exception>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error.toString(), contains('Failed to load spells'));
        },
      );
    });

    test('returns empty list when no spells are available', () async {
      when(
        () => mockRepository.getSummonerSpells(),
      ).thenAnswer((_) async => const Result.success([]));

      final result = await useCase();

      result.when(
        success: (spells) {
          expect(spells, isEmpty);
        },
        failure: (_) => fail('Expected success'),
      );
    });
  });
}
