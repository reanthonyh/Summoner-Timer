import 'package:test/test.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

void main() {
  group('Region Entity', () {
    test('Region enum has all expected values', () {
      expect(Region.values, [
        Region.lan,
        Region.las,
        Region.na,
        Region.euw,
      ]);
    });

    test('each region has unique identity', () {
      expect(Region.lan, isNot(equals(Region.las)));
      expect(Region.las, isNot(equals(Region.na)));
      expect(Region.na, isNot(equals(Region.euw)));
      expect(Region.euw, isNot(equals(Region.lan)));
    });

    test('Region enum can be used in switch expressions', () {
      String getRegionName(Region region) {
        return switch (region) {
          Region.lan => 'LAN',
          Region.las => 'LAS',
          Region.na => 'NA',
          Region.euw => 'EUW',
        };
      }

      expect(getRegionName(Region.lan), 'LAN');
      expect(getRegionName(Region.las), 'LAS');
      expect(getRegionName(Region.na), 'NA');
      expect(getRegionName(Region.euw), 'EUW');
    });

    test('toString returns enum name', () {
      expect(Region.lan.toString(), 'Region.lan');
      expect(Region.euw.toString(), 'Region.euw');
    });
  });
}