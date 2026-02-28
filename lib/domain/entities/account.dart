import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summoner_timer/core/networking/dio_client.dart';

part 'account.freezed.dart';

enum Region {
  lan('la1', RiotHost.la1),
  las('la2', RiotHost.la2),
  na('na1', RiotHost.na1);

  final String code;
  final RiotHost host;

  const Region(this.code, this.host);

  RiotHost get platformHost => host;

  RiotHost get regionalHost => RiotHost.americas;
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
