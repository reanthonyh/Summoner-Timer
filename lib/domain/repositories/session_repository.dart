import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class SessionRepository {
  /// The currently active account.
  Account? get currentAccount;

  /// Updates the session with a new account.
void setAccount(Account account);

  /// Clears the session (logout/reset).
  void clear();
}
