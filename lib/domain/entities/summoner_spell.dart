import 'package:freezed_annotation/freezed_annotation.dart';

part 'summoner_spell.freezed.dart';

@freezed
abstract class SummonerSpell with _$SummonerSpell {
  const factory SummonerSpell({
    required String id,
    required String name,
    required int cooldownSeconds,
    required String spriteUrl,
    required String imageUrl,
  }) = _SummonerSpell;
}
