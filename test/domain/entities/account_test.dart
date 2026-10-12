import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import '../../helpers/test_data.dart';

void main() {
  group('Account Entity', () {
    test('creates Account with all required fields', () {
      final account = createTestAccount();

      expect(account.puuid, 'test-puuid-123');
      expect(account.level, 100);
      expect(account.gameName, 'TestSummoner');
      expect(account.tagLine, 'NA1');
      expect(account.region, Region.na);
      expect(account.iconUrl, contains('ddragon.leagueoflegends.com'));
    });

    test('riotID getter returns correct format', () {
      final account = createTestAccount(gameName: 'MyName', tagLine: 'MYTAG');

      expect(account.riotID, 'MyName#MYTAG');
    });

    test('equality works correctly for same values', () {
      final account1 = createTestAccount(puuid: 'same-puuid');
      final account2 = createTestAccount(puuid: 'same-puuid');

      expect(account1, equals(account2));
      expect(account1.hashCode, equals(account2.hashCode));
    });

    test('inequality works for different puuid', () {
      final account1 = createTestAccount(puuid: 'puuid-1');
      final account2 = createTestAccount(puuid: 'puuid-2');

      expect(account1, isNot(equals(account2)));
    });

    test('copyWith creates new instance with updated fields', () {
      final original = createTestAccount(level: 50);
      final updated = original.copyWith(level: 100);

      expect(updated.level, 100);
      expect(updated.puuid, original.puuid);
      expect(updated.gameName, original.gameName);
      expect(original.level, 50);
    });

    test('toString contains relevant information', () {
      final account = createTestAccount(gameName: 'TestUser', tagLine: 'TAG');

      final str = account.toString();
      expect(str, contains('TestUser'));
      expect(str, contains('TAG'));
      expect(str, contains('test-puuid-123'));
    });
  });
}