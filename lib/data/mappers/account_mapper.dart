import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/data/models/models.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract final class AccountMapper {
  static Account fromModels({
    required AccountModelResponse accountModel,
    required SummonerModelResponse summonerModel,
    required RegionModelResponse regionModel,
  }) {
    return Account(
      puuid: accountModel.puuid ?? '',
      level: summonerModel.summonerLevel ?? 0,
      gameName: accountModel.gameName ?? '',
      tagLine: accountModel.tagLine ?? '',
      region: RiotPlatform.values
          .firstWhere((element) => element.name == regionModel.region, orElse: () => .la1)
          .toRegion,
      iconUrl: DataDragonURL.iconUrl(summonerModel.profileIconId.toString()),
    );
  }

  static Account fromModel(AccountModelResponse accountModel) {
    return Account(
      puuid: accountModel.puuid ?? '',
      level: 0,
      gameName: accountModel.gameName ?? '',
      tagLine: accountModel.tagLine ?? '',
      region: Region.lan,
      iconUrl: DataDragonURL.iconUrl('0'),
    );
  }

  static AccountModelResponse toModel(Account account) {
    return AccountModelResponse(
      puuid: account.puuid,
      gameName: account.gameName,
      tagLine: account.tagLine,
    );
  }
}

extension on RiotPlatform {
  Region get toRegion => switch (this) {
    .la1 => Region.lan,
    .la2 => Region.las,
    .na1 => Region.na,
    .euw1 => Region.euw,
    _ => Region.lan,
  };
}
