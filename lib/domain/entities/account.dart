class Account {
  const Account({required this.puuid, required this.gameName, required this.tagLine});

  final String puuid;
  final String gameName;
  final String tagLine;

  @override
  String toString() => 'Account(puuid: $puuid, gameName: $gameName, tagLine: $tagLine)';
}
