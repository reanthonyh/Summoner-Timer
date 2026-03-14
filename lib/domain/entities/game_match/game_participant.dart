import 'package:freezed_annotation/freezed_annotation.dart';

import '../summoner_spells/summoner_spell.dart';

part 'game_participant.freezed.dart';

enum Team { ally, enemy }

@freezed
abstract class GameParticipant with _$GameParticipant {
  const factory GameParticipant({
    required String? puuid,
    @Default(false) bool isBot,
    required SummonerSpell spellOne,
    required SummonerSpell spellTwo,
    required String riotId,
    required int championId,
    required Team team,
  }) = _GameParticipant;
}
