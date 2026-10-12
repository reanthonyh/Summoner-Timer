import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import '../../helpers/test_data.dart';

void main() {
  group('GameInformation Entity', () {
    late SummonerSpell testSpellOne;
    late SummonerSpell testSpellTwo;
    late GameParticipant allyParticipant;
    late GameParticipant enemyParticipant;

    setUp(() {
      testSpellOne = createTestSummonerSpell(id: '4', name: 'Flash', cooldownSeconds: 300);
      testSpellTwo = createTestSummonerSpell(id: '14', name: 'Ignite', cooldownSeconds: 180);

      allyParticipant = createTestGameParticipant(
        puuid: 'ally-puuid',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        riotId: 'AllyPlayer#NA1',
        team: Team.ally,
      );

      enemyParticipant = createTestGameParticipant(
        puuid: 'enemy-puuid',
        spellOne: testSpellOne,
        spellTwo: testSpellTwo,
        riotId: 'EnemyPlayer#EUW',
        team: Team.enemy,
      );
    });

    test('creates GameInformation with matchId and players', () {
      final gameInfo = createTestGameInformation(
        matchId: 'match-123',
        players: [allyParticipant, enemyParticipant],
      );

      expect(gameInfo.matchId, 'match-123');
      expect(gameInfo.players.length, 2);
      expect(gameInfo.players[0].riotId, 'AllyPlayer#NA1');
      expect(gameInfo.players[1].riotId, 'EnemyPlayer#EUW');
    });

    test('creates GameInformation with empty players list', () {
      final gameInfo = createTestGameInformation(matchId: 'match-empty', players: []);

      expect(gameInfo.matchId, 'match-empty');
      expect(gameInfo.players, isEmpty);
    });

    test('can have null matchId', () {
      final gameInfo = createTestGameInformation(matchId: null, players: [allyParticipant]);

      expect(gameInfo.matchId, isNull);
      expect(gameInfo.players.length, 1);
    });

    test('equality works correctly for same values', () {
      final gameInfo1 = createTestGameInformation(
        matchId: 'same-match',
        players: [allyParticipant],
      );
      final gameInfo2 = createTestGameInformation(
        matchId: 'same-match',
        players: [allyParticipant],
      );

      expect(gameInfo1, equals(gameInfo2));
      expect(gameInfo1.hashCode, equals(gameInfo2.hashCode));
    });

    test('inequality works for different matchId', () {
      final gameInfo1 = createTestGameInformation(matchId: 'match-1', players: []);
      final gameInfo2 = createTestGameInformation(matchId: 'match-2', players: []);

      expect(gameInfo1, isNot(equals(gameInfo2)));
    });

    test('copyWith creates new instance with updated fields', () {
      final original = createTestGameInformation(
        matchId: 'original-match',
        players: [allyParticipant],
      );
      final updated = original.copyWith(matchId: 'updated-match');

      expect(updated.matchId, 'updated-match');
      expect(updated.players, original.players);
      expect(original.matchId, 'original-match');
    });

    test('toString contains relevant information', () {
      final gameInfo = createTestGameInformation(
        matchId: 'match-456',
        players: [allyParticipant, enemyParticipant],
      );

      final str = gameInfo.toString();
      expect(str, contains('match-456'));
      expect(str, contains('AllyPlayer#NA1'));
      expect(str, contains('EnemyPlayer#EUW'));
    });
  });
}