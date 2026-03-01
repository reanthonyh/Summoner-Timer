import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
import 'package:summoner_timer/data/mappers/mappers.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class SummonerSpellsRepositoryImpl implements SummonerSpellsRepository {
  SummonerSpellsRepositoryImpl({DataDragonApi? dataSource})
    : dataSource = dataSource ?? DataDragonApi();

  final DataDragonApi dataSource;

  @override
  Future<List<SummonerSpell>> getSummonerSpells() async {
    try {
      final response = await dataSource.getSummonerSpells();

      final summonerSpells =
          response.data?.values.map(SummonerSpellMapper.fromModel).toList() ?? [];

      return summonerSpells;
    } catch (e) {
      print('SummonerSpellsRepositoryImpl - Error: $e');
      rethrow;
    }
  }
}
