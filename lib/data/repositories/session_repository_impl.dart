import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class SessionRepositoryImpl implements SessionRepository {
  // Simple in-memory storage for the current session.
  // This could be easily extended to use SharedPreferences or SecureStorage.
  Account? _currentAccount;

  @override
  Account? get currentAccount => _currentAccount;

  @override
  void setAccount(Account account) => _currentAccount = account;

  @override
  void clear() => _currentAccount = null;
}
