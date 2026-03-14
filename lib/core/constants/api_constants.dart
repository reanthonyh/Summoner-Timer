abstract final class DataDragonURL {
  static const String dataDragonVersion = '16.5.1';
  static const String dataDragonBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn/$dataDragonVersion';

  static String iconUrl(String iconPng) =>
      '$dataDragonBaseUrl/img/profileicon/$iconPng.png';
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
