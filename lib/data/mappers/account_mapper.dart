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
      region: Region.values.firstWhere(
        (element) => element.name == regionModel.region,
        orElse: () => Region.lan,
      ),
      profileIconId: summonerModel.profileIconId,
    );
  }

  static Account fromModel(AccountModelResponse accountModel) {
    return Account(
      puuid: accountModel.puuid ?? '',
      level: 0,
      gameName: accountModel.gameName ?? '',
      tagLine: accountModel.tagLine ?? '',
      region: Region.lan,
      profileIconId: 0,
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
