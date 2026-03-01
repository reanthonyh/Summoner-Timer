import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_information.freezed.dart';

@freezed
abstract class GameInformation with _$GameInformation {
  const factory GameInformation({
    required String? matchId,
    required List<GameParticipant> players,
  }) = _GameInformation;
}

@freezed
abstract class GameParticipant with _$GameParticipant {
  const factory GameParticipant({
    required String? puuid,
    @Default(false) bool isBot,
    required SummonerSpell spellOne,
    required SummonerSpell spellTwo,
  }) = _GameParticipant;
}

@freezed
abstract class SummonerSpell with _$SummonerSpell {
  const factory SummonerSpell({
    required String id,
    required String name,
    required int cooldownSeconds,
  }) = _SummonerSpell;
}
