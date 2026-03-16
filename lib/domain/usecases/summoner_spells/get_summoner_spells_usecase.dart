import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/summoner_spells_repository.dart';

final class GetSummonerSpellsUseCase {
  GetSummonerSpellsUseCase({required this.repository});

  final SummonerSpellsRepository repository;

  AsyncResult<List<SummonerSpell>> call() {
    return repository.getSummonerSpells();
  }
}
