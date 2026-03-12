import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/datasources/local_summoner_spells_datasource.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class SummonerSpellsRepositoryImpl implements SummonerSpellsRepository {
  SummonerSpellsRepositoryImpl({required this.dataSource});

  final DataDragonApi dataSource;
  List<SummonerSpell>? _cachedSpells;

  static const Set<String> _allowedModes = {'CLASSIC', 'URF', 'ARAM'};

  static bool _isAllowedMode(List<String>? modes) {
    if (modes == null || modes.isEmpty) return false;
    return modes.any((mode) => _allowedModes.contains(mode));
  }

  @override
  Future<List<SummonerSpell>> getSummonerSpells() async {
    if (_cachedSpells != null) {
      return _cachedSpells!;
    }

    try {
      final response = await dataSource.getSummonerSpells();

      final summonerSpells =
          response.data?.values
              .map((spell) => SummonerSpellMapper.fromModel(spell, dataSource))
              .toList() ??
          [];

      final filteredSpells = summonerSpells.where((spell) {
        return _isAllowedMode(spell.modes);
      }).toList();

      _cachedSpells = filteredSpells;
      return filteredSpells;
    } catch (e) {
      print('SummonerSpellsRepositoryImpl - Error: $e, using offline data');
      return _getOfflineSpells();
    }
  }

  List<SummonerSpell> _getOfflineSpells() {
    final offlineData = LocalSummonerSpellsDataSource.getSummonerSpells();
    final spells =
        offlineData.data?.values
            .map((spell) => SummonerSpellMapper.fromModel(spell, dataSource))
            .toList() ??
        [];

    _cachedSpells = spells;
    return spells;
  }
}
