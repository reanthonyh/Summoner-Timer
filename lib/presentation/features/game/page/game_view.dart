part of 'game_page.dart';

final class _GameView extends StatefulWidget {
  const _GameView();

  @override
  State<_GameView> createState() => _GameViewState();
}

class _GameViewState extends State<_GameView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<GameBloc>().add(const GameEvent.loadGame());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<GameBloc>().add(const GameEvent.resumeTimers());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.game_live_title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          buildWhen: (previous, current) =>
              previous.status != current.status ||
              previous.gameInformation != current.gameInformation,
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status.isError) {
              return const _ErrorView();
            }

            if (state.status.isSuccess && state.gameInformation != null) {
              return _GameContent(
                gameInformation: state.gameInformation!,
              );
            }

            return const _NoGameView();
          },
          listener: (context, state) {
            // No-op for now, removed GameViewEvent
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
