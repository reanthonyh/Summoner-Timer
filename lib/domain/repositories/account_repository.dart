import 'dart:async';

import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class AccountRepository {
  Future<Account> retrieveUserByNameTag({required String name, required String tag});
}
