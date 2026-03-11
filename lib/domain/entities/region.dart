import 'package:freezed_annotation/freezed_annotation.dart';
import 'riot_host.dart';

enum Region {
  @JsonValue('la1')
  lan('la1', RiotHost.la1),
  @JsonValue('la2')
  las('la2', RiotHost.la2),
  @JsonValue('na1')
  na('na1', RiotHost.na1);

  final String code;
  final RiotHost host;

  const Region(this.code, this.host);

  RiotHost get platformHost => host;

  RiotHost get regionalHost => RiotHost.americas;

  static Region fromCode(String code) {
    return Region.values.firstWhere(
      (r) => r.code == code,
      orElse: () => Region.lan,
    );
  }
}
