import 'dart:async';

abstract interface class AccountRepository {
  FutureOr<void> retrieveUserByNameTag({
    required String name,
    required String tag,
  });
}
