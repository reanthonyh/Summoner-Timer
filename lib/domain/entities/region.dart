import 'package:summoner_timer/core/networking/dio_client.dart';

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
