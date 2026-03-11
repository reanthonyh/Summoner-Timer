enum RiotHost {
  americas('https://americas.api.riotgames.com'),
  europe('https://europe.api.riotgames.com'),
  asia('https://asia.api.riotgames.com'),

  // Platform Hosts
  la1('https://la1.api.riotgames.com'),
  la2('https://la2.api.riotgames.com'),
  na1('https://na1.api.riotgames.com'),
  euw1('https://euw1.api.riotgames.com');

  const RiotHost(this.url);
  final String url;
}
