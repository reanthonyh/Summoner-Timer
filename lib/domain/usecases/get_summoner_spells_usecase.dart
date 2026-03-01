import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class GetSummonerSpellsUseCase {
  GetSummonerSpellsUseCase({required this.repository});

  final SummonerSpellsRepository repository;

  Future<List<SummonerSpell>> call() {
    return repository.getSummonerSpells();
  }
}
