import 'package:summoner_timer/data/models/accounts/account_model_response.dart';
import 'package:summoner_timer/data/models/accounts/region_model_response.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

class AccountMapper {
  AccountMapper._();

  static Account fromModels({
    required AccountModelResponse accountModel,
    required RegionModelResponse regionModel,
  }) {
    return Account(
      puuid: accountModel.puuid ?? '',
      gameName: accountModel.gameName ?? '',
      tagLine: accountModel.tagLine ?? '',
      region: Region.values.firstWhere(
        (element) => element.code == regionModel.region,
        orElse: () => Region.lan,
      ),
      profileIconId: accountModel.profileIconId,
    );
  }
}
