import 'package:freezed_annotation/freezed_annotation.dart';

import 'region.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const Account._();

  const factory Account({
    required String puuid,
    required int level,
    required String gameName,
    required String tagLine,
    required Region region,
    required String iconUrl,
  }) = _Account;

  String get riotID => '$gameName#$tagLine';
}
