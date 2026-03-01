import 'package:summoner_timer/data/models/summoner_spells/summoner_spell_model.dart';
import 'package:summoner_timer/data/models/summoner_spells/summoner_spell_image_model.dart';
import 'package:summoner_timer/data/models/summoner_spells/summoner_spells_model_response.dart';

final class LocalSummonerSpellsDataSource {
  LocalSummonerSpellsDataSource._();

  static const String _baseUrl = 'https://ddragon.leagueoflegends.com/cdn/16.4.1';

  static String getFullImageUrl(String fullName) => '$_baseUrl/img/spell/$fullName';
  static String getSpriteUrl(String spriteName) => '$_baseUrl/img/sprite/$spriteName';

  static SummonerSpellsModelResponse getSummonerSpells() {
    return SummonerSpellsModelResponse(
      type: 'summoner',
      version: '16.4.1',
      data: {
        'SummonerBarrier': _createSpell(
          id: 'SummonerBarrier',
          name: 'Barrier',
          description:
              'Shields your champion from 115-455 damage (depending on champion level) for 2 seconds.',
          cooldown: [180],
          key: '21',
          image: 'SummonerBarrier.png',
        ),
        'SummonerBoost': _createSpell(
          id: 'SummonerBoost',
          name: 'Cleanse',
          description:
              'Removes all disables (except suppression) and summoner spell debuffs from your champion.',
          cooldown: [210],
          key: '1',
          image: 'SummonerBoost.png',
        ),
        'SummonerExhaust': _createSpell(
          id: 'SummonerExhaust',
          name: 'Exhaust',
          description:
              'Exhausts target enemy champion, dealing 70-410 true damage and reducing their movement speed and damage by 30% for 2.5 seconds.',
          cooldown: [210],
          key: '3',
          image: 'SummonerExhaust.png',
        ),
        'SummonerFlash': _createSpell(
          id: 'SummonerFlash',
          name: 'Flash',
          description:
              'Teleports your champion a short distance toward your cursor\'s location.',
          cooldown: [300],
          key: '4',
          image: 'SummonerFlash.png',
        ),
        'SummonerGhost': _createSpell(
          id: 'SummonerGhost',
          name: 'Ghost',
          description:
              'Your champion can move through units and gains 28-45% (depending on champion level) increased movement speed for 10 seconds.',
          cooldown: [180],
          key: '6',
          image: 'SummonerGhost.png',
        ),
        'SummonerHeal': _createSpell(
          id: 'SummonerHeal',
          name: 'Heal',
          description:
              'Restores 75-345 health (depending on champion level) and grants 30% movement speed for 1 second to you and target allied champion.',
          cooldown: [240],
          key: '7',
          image: 'SummonerHeal.png',
        ),
        'SummonerSmite': _createSpell(
          id: 'SummonerSmite',
          name: 'Smite',
          description:
              'Deals 450-1000 true damage to a large monster or enemy minion. Restores 20% of the cooldown when used on a large monster.',
          cooldown: [15],
          key: '11',
          image: 'SummonerSmite.png',
        ),
        'SummonerTeleport': _createSpell(
          id: 'SummonerTeleport',
          name: 'Teleport',
          description:
              'After channeling for 4 seconds, teleports your champion to target allied turret, minion, or ward.',
          cooldown: [240],
          key: '12',
          image: 'SummonerTeleport.png',
        ),
        'SummonerMana': _createSpell(
          id: 'SummonerMana',
          name: 'Clarity',
          description:
              'Restores 50% of your champion\'s maximum mana. Restores 50% of target allied champion\'s maximum mana.',
          cooldown: [240],
          key: '13',
          image: 'SummonerMana.png',
        ),
        'SummonerIgnite': _createSpell(
          id: 'SummonerIgnite',
          name: 'Ignite',
          description:
              'Deals 70-410 true damage over 5 seconds to target enemy champion and applies Grievous Wounds for the duration.',
          cooldown: [180],
          key: '14',
          image: 'SummonerIgnite.png',
        ),
      },
    );
  }

  static SummonerSpellModel _createSpell({
    required String id,
    required String name,
    required String description,
    required List<int> cooldown,
    required String key,
    required String image,
  }) {
    return SummonerSpellModel(
      id: id,
      name: name,
      description: description,
      cooldown: cooldown,
      key: key,
      image: SummonerSpellImageModel(
        full: image,
        sprite: 'spell0.png',
        group: 'spell',
        x: 0,
        y: 0,
        w: 48,
        h: 48,
      ),
    );
  }
}
