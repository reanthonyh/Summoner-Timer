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
    return const Scaffold(appBar: _GameAppBar(), body: _GameBody());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
