import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class SummonerSpellsRepositoryImpl implements SummonerSpellsRepository {
  SummonerSpellsRepositoryImpl({DataDragonApi? dataSource})
    : dataSource = dataSource ?? DataDragonApi();

  final DataDragonApi dataSource;
  List<SummonerSpell>? _cachedSpells;

  @override
  Future<List<SummonerSpell>> getSummonerSpells() async {
    if (_cachedSpells != null) {
      return _cachedSpells!;
    }

    try {
      final response = await dataSource.getSummonerSpells();

      final summonerSpells =
          response.data?.values.map(SummonerSpellMapper.fromModel).toList() ?? [];

      _cachedSpells = summonerSpells;
      return summonerSpells;
    } catch (e) {
      print('SummonerSpellsRepositoryImpl - Error: $e');
      rethrow;
    }
  }
}
