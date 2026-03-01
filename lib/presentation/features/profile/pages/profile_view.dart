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

                return GameGrid(gameInformation: gameInformation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
