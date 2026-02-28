import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

enum Region {
  lan('la1'),
  las('la2'),
  na('na1');

  final String code;

  const Region(this.code);

  String get platformHost => 'https://$code.api.riotgames.com';
}

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String puuid,
    required String gameName,
    required String tagLine,
    required Region region,
  }) = _Account;
}
