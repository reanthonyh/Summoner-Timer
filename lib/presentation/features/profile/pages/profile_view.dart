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

      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.status == UiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == UiStatus.error) {
            return const Center(child: Text('Error loading game information'));
          }

          if (state.gameInformation == null) {
            return const Center(child: Text('Summoner is not currently in a game'));
          }

          final game = state.gameInformation!;

          return ListView.builder(
            itemCount: game.players.length,
            itemBuilder: (context, index) {
              final player = game.players.elementAt(index);

              return ListTile(
                title: Text(player.riotId),
                subtitle: Row(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CachedNetworkImage(imageUrl: player.spellOne.spriteUrl),
                    CachedNetworkImage(imageUrl: player.spellTwo.spriteUrl),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
