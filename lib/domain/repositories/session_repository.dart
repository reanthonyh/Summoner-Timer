import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SessionRepository {
  Account? get currentAccount;

  RiotHost get platformHost;

  RiotHost get regionalHost;

  void setAccount(Account account);

  void clear();
}
