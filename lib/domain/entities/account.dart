import 'package:freezed_annotation/freezed_annotation.dart';

import 'region.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String puuid,
    required String gameName,
    required String tagLine,
    required Region region,
  }) = _Account;
}
