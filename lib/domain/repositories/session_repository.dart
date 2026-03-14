import 'package:summoner_timer/core/constants/api_constants.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SessionRepository {
  Account? get currentAccount;

  RiotPlatform get platformHost;

  RiotRegion get regionalHost;

  void setAccount(Account account);

  void clear();
}
