part of 'profile_page.dart';

final class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),

      body: Column(
        children: [
          BlocSelector<ProfileCubit, ProfileState, Account?>(
            selector: (state) => state.account,
            builder: (context, account) {
              if (account == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${account.gameName}#${account.tagLine}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            },
          ),
          const Divider(),
          Expanded(
            child: BlocSelector<ProfileCubit, ProfileState, (UiStatus, GameInformation?)>(
              selector: (state) => (state.status, state.gameInformation),
              builder: (context, state) {
                final (status, gameInformation) = state;

                if (status == UiStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (status == UiStatus.error) {
                  return const Center(child: Text('Error loading game information'));
                }

                if (gameInformation == null) {
                  return const Center(child: Text('Summoner is not currently in a game'));
                }

                return Column(
                  children: [
                    Text(
                      "Game Information",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: gameInformation.players.length,
                        itemBuilder: (context, index) {
                          final player = gameInformation.players.elementAt(index);

                          return ListTile(
                            title: Text(player.riotId),
                            subtitle: Row(
                              spacing: 8,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: player.spellOne.spriteUrl,
                                  width: 32,
                                  height: 32,
                                ),
                                CachedNetworkImage(
                                  imageUrl: player.spellTwo.spriteUrl,
                                  width: 32,
                                  height: 32,
                                ),
                                Text("ID: ${player.riotId}"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
