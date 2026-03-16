import 'package:result_dart/result_dart.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class GetAccountUseCase {
  GetAccountUseCase({required this.repository});

  final AccountRepository repository;

  AsyncResult<Account> call({({String name, String tag})? riotId, String? puuid}) async {
    if (puuid != null) {
      return repository.retrieveSummonerByPUUID(puuid);
    }
    if (riotId != null) {
      return repository.retrieveSummonerByNameTag(name: riotId.name, tag: riotId.tag);
    }

    return Exception('Either riotId or puuid must be provided').toFailure();
  }
}
