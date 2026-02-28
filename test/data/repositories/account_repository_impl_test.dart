import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summoner_timer/data/datasources/riot_americas_api.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/data/repositories/account_repository_impl.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

class MockRiotAmericasApi extends Mock implements RiotAmericasApi {}

class FakeAccountModelRequest extends Fake implements AccountModelRequest {}

void main() {
  late AccountRepositoryImpl repository;
  late MockRiotAmericasApi mockDataSource;

  setUpAll(() {
    registerFallbackValue(FakeAccountModelRequest());
  });

  setUp(() {
    mockDataSource = MockRiotAmericasApi();
    repository = AccountRepositoryImpl(dataSource: mockDataSource);
  });

  group('AccountRepositoryImpl', () {
    const testName = 'TestName';
    const testTag = 'TEST';

    final testResponse = AccountModelResponse(
      puuid: 'test-puuid-123',
      gameName: 'TestGameName',
      tagLine: 'TEST',
    );

    test('retrieveSummonerByNameTag returns Account entity', () async {
      when(() => mockDataSource.getAccount(any())).thenAnswer((_) async => testResponse);
      when(() => mockDataSource.getSummonerRegion(any())).thenAnswer(
        (_) async => const RegionModelResponse(region: 'la1'),
      );

      final result = await repository.retrieveSummonerByNameTag(name: testName, tag: testTag);

      expect(result.puuid, equals('test-puuid-123'));
      expect(result.gameName, equals('TestGameName'));
      expect(result.tagLine, equals('TEST'));
      expect(result.region, equals(Region.lan));
    });

    test('retrieveSummonerByNameTag throws Exception when puuid is null', () async {
      when(
        () => mockDataSource.getAccount(any()),
      ).thenAnswer((_) async => const AccountModelResponse(puuid: null));

      expect(
        () => repository.retrieveSummonerByNameTag(name: testName, tag: testTag),
        throwsA(isA<Exception>()),
      );
    });

    test('retrieveSummonerByNameTag throws Exception when dataSource throws', () async {
      when(() => mockDataSource.getAccount(any())).thenThrow(Exception('API Error'));

      expect(
        () => repository.retrieveSummonerByNameTag(name: testName, tag: testTag),
        throwsA(isA<Exception>()),
      );
    });
  });
}
