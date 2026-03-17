import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class SessionRepositoryImpl implements SessionRepository {
  Account? _currentAccount;

  @override
  Account? get currentAccount => _currentAccount;

  @override
  RiotPlatform get platformHost {
    final region = _currentAccount?.region;
    if (region == null) return RiotPlatform.la1;

    return switch (region) {
      .lan => RiotPlatform.la1,
      .las => RiotPlatform.la2,
      .na => RiotPlatform.na1,
      .euw => RiotPlatform.euw1,
    };
  }

  @override
  RiotRegion get regionalHost =>
      (_currentAccount?.region == Region.euw ? RiotRegion.europe : RiotRegion.americas);

  @override
  void setAccount(Account account) => _currentAccount = account;

  @override
  void clear() => _currentAccount = null;
}
