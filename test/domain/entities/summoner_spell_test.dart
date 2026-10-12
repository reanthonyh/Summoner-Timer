import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import '../../helpers/test_data.dart';

void main() {
  group('SummonerSpell Entity', () {
    test('creates SummonerSpell with all required fields', () {
      final spell = createTestSummonerSpell();

      expect(spell.id, '4');
      expect(spell.name, 'Flash');
      expect(spell.cooldownSeconds, 300);
      expect(spell.modes, ['CLASSIC', 'ARAM']);
      expect(spell.imageUrl, contains('ddragon.leagueoflegends.com'));
      expect(spell.spriteUrl, contains('ddragon.leagueoflegends.com'));
    });

    test('equality works correctly for same values', () {
      final spell1 = createTestSummonerSpell(id: '4');
      final spell2 = createTestSummonerSpell(id: '4');

      expect(spell1, equals(spell2));
      expect(spell1.hashCode, equals(spell2.hashCode));
    });

    test('inequality works for different id', () {
      final spell1 = createTestSummonerSpell(id: '4');
      final spell2 = createTestSummonerSpell(id: '14');

      expect(spell1, isNot(equals(spell2)));
    });

    test('copyWith creates new instance with updated fields', () {
      final original = createTestSummonerSpell(cooldownSeconds: 300);
      final updated = original.copyWith(cooldownSeconds: 180);

      expect(updated.cooldownSeconds, 180);
      expect(updated.id, original.id);
      expect(updated.name, original.name);
      expect(original.cooldownSeconds, 300);
    });

    test('modes filtering - CLASSIC mode', () {
      final spell = createTestSummonerSpell(modes: ['CLASSIC', 'URF']);

      expect(spell.modes, contains('CLASSIC'));
      expect(spell.modes, contains('URF'));
    });

    test('modes filtering - ARAM mode', () {
      final spell = createTestSummonerSpell(modes: ['ARAM']);

      expect(spell.modes, contains('ARAM'));
    });

    test('toString contains relevant information', () {
      final spell = createTestSummonerSpell(name: 'Flash', id: '4');

      final str = spell.toString();
      expect(str, contains('Flash'));
      expect(str, contains('4'));
      expect(str, contains('300'));
    });

    test('different spells have different cooldowns', () {
      final flash = createTestSummonerSpell(id: '4', name: 'Flash', cooldownSeconds: 300);
      final ignite = createTestSummonerSpell(id: '14', name: 'Ignite', cooldownSeconds: 180);
      final heal = createTestSummonerSpell(id: '7', name: 'Heal', cooldownSeconds: 240);

      expect(flash.cooldownSeconds, 300);
      expect(ignite.cooldownSeconds, 180);
      expect(heal.cooldownSeconds, 240);
    });
  });
}