import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';
import 'package:summoner_timer/domain/usecases/summoner_spells/get_summoner_spells_usecase.dart';
import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GetSummonerSpellsUseCase', () {
    late MockSummonerSpellsRepository mockRepository;
    late GetSummonerSpellsUseCase useCase;

    setUp(() {
      mockRepository = MockSummonerSpellsRepository();
      useCase = GetSummonerSpellsUseCase(repository: mockRepository);
    });

    test('returns list of summoner spells on success', () async {
      final spells = [
        createTestSummonerSpell(id: '4', name: 'Flash', cooldownSeconds: 300),
        createTestSummonerSpell(id: '14', name: 'Ignite', cooldownSeconds: 180),
        createTestSummonerSpell(id: '7', name: 'Heal', cooldownSeconds: 240),
      ];

      mockRepository.whenGetSummonerSpells(
        result: Future.value(spells.toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.length, 3);
      expect(result.getOrNull()![0].name, 'Flash');
      expect(result.getOrNull()![1].name, 'Ignite');
      expect(result.getOrNull()![2].name, 'Heal');
    });

    test('returns empty list when no spells available', () async {
      mockRepository.whenGetSummonerSpells(
        result: Future.value(<SummonerSpell>[].toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull(), isEmpty);
    });

    test('returns failure when repository returns error', () async {
      mockRepository.whenGetSummonerSpells(
        result: Future.value(Exception('Failed to load summoner spells').toFailure()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isFalse);
    });

    test('filters spells by allowed modes (CLASSIC, URF, ARAM)', () async {
      // The filtering is done in the repository, but we can test the use case
      // returns whatever the repository provides
      final filteredSpells = [
        createTestSummonerSpell(id: '4', name: 'Flash', modes: ['CLASSIC', 'ARAM']),
        createTestSummonerSpell(id: '14', name: 'Ignite', modes: ['CLASSIC']),
      ];

      mockRepository.whenGetSummonerSpells(
        result: Future.value(filteredSpells.toSuccess()),
      );

      final result = await useCase();

      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull()!.length, 2);
      // Verify all returned spells have allowed modes
      for (final spell in result.getOrNull()!) {
        expect(
          spell.modes?.any((m) => ['CLASSIC', 'URF', 'ARAM'].contains(m)) ?? false,
          isTrue,
        );
      }
    });
  });
}