import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GameParticipant Entity', () {
    late SummonerSpell testSpellOne;
    late SummonerSpell testSpellTwo;

    setUp(() {
      testSpellOne = createTestSummonerSpell(id: '4', name: 'Flash', cooldownSeconds: 300);
      testSpellTwo = createTestSummonerSpell(id: '14', name: 'Ignite', cooldownSeconds: 180);
    });

    test('creates GameParticipant with all required fields', () {
      final participant = createTestGameParticipant(
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
      );

      expect(participant.puuid, 'participant-puuid');
      expect(participant.isBot, false);
      expect(participant.spellOne, testSpellOne);
      expect(participant.spellTwo, testSpellTwo);
      expect(participant.riotId, 'TestPlayer#NA1');
      expect(participant.championId, 1);
      expect(participant.team, Team.ally);
    });

    test('Team enum has correct values', () {
      expect(Team.ally, Team.ally);
      expect(Team.enemy, Team.enemy);
      expect(Team.values, [Team.ally, Team.enemy]);
    });

    test('equality works correctly for same values', () {
      final participant1 = createTestGameParticipant(
        puuid: 'same-puuid',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
      );
      final participant2 = createTestGameParticipant(
        puuid: 'same-puuid',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
      );

      expect(participant1, equals(participant2));
      expect(participant1.hashCode, equals(participant2.hashCode));
    });

    test('inequality works for different puuid', () {
      final participant1 = createTestGameParticipant(
        puuid: 'puuid-1',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
      );
      final participant2 = createTestGameParticipant(
        puuid: 'puuid-2',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
      );

      expect(participant1, isNot(equals(participant2)));
    });

    test('copyWith creates new instance with updated fields', () {
      final original = createTestGameParticipant(
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        championId: 10,
      );
      final updated = original.copyWith(championId: 20);

      expect(updated.championId, 20);
      expect(updated.puuid, original.puuid);
      expect(updated.team, original.team);
      expect(original.championId, 10);
    });

    test('can create enemy team participant', () {
      final enemy = createTestGameParticipant(
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        team: Team.enemy,
        riotId: 'EnemyPlayer#EUW',
      );

      expect(enemy.team, Team.enemy);
      expect(enemy.riotId, 'EnemyPlayer#EUW');
    });

    test('can create bot participant', () {
      final bot = createTestGameParticipant(
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        isBot: true,
        riotId: 'BotPlayer',
      );

      expect(bot.isBot, true);
    });

    test('toString contains relevant information', () {
      final participant = createTestGameParticipant(
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        riotId: 'TestPlayer#NA1',
      );

      final str = participant.toString();
      expect(str, contains('TestPlayer#NA1'));
      expect(str, contains('Flash'));
      expect(str, contains('Ignite'));
    });
  });
}