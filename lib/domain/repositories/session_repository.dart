import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SessionRepository {
  Account? get currentAccount;

  void setAccount(Account account);

  void clear();
}
