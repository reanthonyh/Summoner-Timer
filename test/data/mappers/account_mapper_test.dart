import 'package:flutter_test/flutter_test.dart';
import 'package:summoner_timer/data/mappers/account_mapper.dart';
import 'package:summoner_timer/data/models/accounts/account_model_response.dart';
import 'package:summoner_timer/data/models/accounts/region_model_response.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

void main() {
  group('AccountMapper', () {
    test('maps AccountModelResponse and RegionModelResponse to Account entity', () {
      const accountModel = AccountModelResponse(
        puuid: 'test-puuid-123',
        gameName: 'TestPlayer',
        tagLine: 'NA1',
        profileIconId: 6,
      );
      const regionModel = RegionModelResponse(region: 'na1');

      final result = AccountMapper.fromModels(
        accountModel: accountModel,
        regionModel: regionModel,
      );

      expect(result.puuid, 'test-puuid-123');
      expect(result.gameName, 'TestPlayer');
      expect(result.tagLine, 'NA1');
      expect(result.region, Region.na);
      expect(result.profileIconId, 6);
    });

    test('handles null values with defaults', () {
      const accountModel = AccountModelResponse();
      const regionModel = RegionModelResponse();

      final result = AccountMapper.fromModels(
        accountModel: accountModel,
        regionModel: regionModel,
      );

      expect(result.puuid, '');
      expect(result.gameName, '');
      expect(result.tagLine, '');
      expect(result.region, Region.lan); // default fallback
      expect(result.profileIconId, null);
    });

    test('maps latin america region correctly', () {
      const accountModel = AccountModelResponse(
        puuid: 'test-puuid',
        gameName: 'Player',
        tagLine: 'LA1',
      );
      const regionModel = RegionModelResponse(region: 'la1');

      final result = AccountMapper.fromModels(
        accountModel: accountModel,
        regionModel: regionModel,
      );

      expect(result.region, Region.lan);
    });

    test('maps las region correctly', () {
      const accountModel = AccountModelResponse(
        puuid: 'test-puuid',
        gameName: 'Player',
        tagLine: 'LA2',
      );
      const regionModel = RegionModelResponse(region: 'la2');

      final result = AccountMapper.fromModels(
        accountModel: accountModel,
        regionModel: regionModel,
      );

      expect(result.region, Region.las);
    });

    test('falls back to lan for unknown region', () {
      const accountModel = AccountModelResponse(
        puuid: 'test-puuid',
        gameName: 'Player',
        tagLine: 'EU1',
      );
      const regionModel = RegionModelResponse(region: 'eu1');

      final result = AccountMapper.fromModels(
        accountModel: accountModel,
        regionModel: regionModel,
      );

      expect(result.region, Region.lan); // default fallback
    });
  });
}
