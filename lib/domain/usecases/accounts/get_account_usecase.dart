import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/account_repository.dart';

final class GetAccountUseCase {
  GetAccountUseCase({required this.repository});

  final AccountRepository repository;

  Future<Result<Account, Exception>> call({
    ({String name, String tag})? riotId,
    String? puuid,
  }) {
    if (puuid != null) {
      return repository.retrieveSummonerByPUUID(puuid);
    }
    if (riotId != null) {
      return repository.retrieveSummonerByNameTag(name: riotId.name, tag: riotId.tag);
    }

    return Future.value(
      Result.failure(Exception('Either riotId or puuid must be provided')),
    );
  }
}
