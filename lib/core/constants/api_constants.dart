abstract final class ApiConstants {
  static const String dataDragonVersion = '16.4.1';
  static const String dataDragonBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn/$dataDragonVersion';
}

enum RiotRegion {
  americas,
  europe,
  asia;

  String get url => 'https://$name.api.riotgames.com';
}

enum RiotPlatform {
  la1,
  la2,
  na1,
  euw1,
  eun1;

  String get url => 'https://$name.api.riotgames.com';
}
