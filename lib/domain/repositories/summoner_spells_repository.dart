import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SummonerSpellsRepository {
  AsyncResult<List<SummonerSpell>> getSummonerSpells();
}
