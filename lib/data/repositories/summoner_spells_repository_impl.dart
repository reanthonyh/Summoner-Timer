import 'package:summoner_timer/data/datasources/data_dragon_api.dart';
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
          response.data?.values.map((spell) {
            final cooldown = spell.cooldown ?? [];
            final cooldownSeconds = cooldown.isNotEmpty ? cooldown.first : 0;

            return SummonerSpell(
              id: spell.id?.toString() ?? '',
              name: spell.name ?? '',
              cooldownSeconds: cooldownSeconds,
            );
          }).toList() ??
          [];

      return summonerSpells;
    } catch (e) {
      print('SummonerSpellsRepositoryImpl - Error: $e');
      rethrow;
    }
  }
}
