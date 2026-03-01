import 'dart:async';

import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SummonerSpellsRepository {
  Future<List<SummonerSpell>> getSummonerSpells();
}
