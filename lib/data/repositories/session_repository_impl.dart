import 'package:summoner_timer/core/networking/dio_client.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

final class SessionRepositoryImpl implements SessionRepository {
  Account? _currentAccount;

  @override
  Account? get currentAccount => _currentAccount;

  @override
  RiotHost get platformHost => _currentAccount?.region.platformHost ?? RiotHost.la1;

  @override
  RiotHost get regionalHost => _currentAccount?.region.regionalHost ?? RiotHost.americas;

  @override
  void setAccount(Account account) => _currentAccount = account;

  @override
  void clear() => _currentAccount = null;
}
