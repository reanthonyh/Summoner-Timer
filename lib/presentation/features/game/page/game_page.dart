import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/theme/theme.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/l10n/l10n.dart';
import 'package:summoner_timer/presentation/features/game/bloc/game_bloc.dart';
import 'package:summoner_timer/presentation/features/game/bloc/game_event.dart';
import 'package:summoner_timer/presentation/features/game/bloc/game_state.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'game_view.dart';
part '../widgets/widgets.dart';

final class GamePage extends StatelessWidget {
  const GamePage({super.key});

  static String get routeName => 'game';

  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const GamePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  static MapEntry<String, WidgetBuilder> get routeEntry =>
      MapEntry(routeName, (context) => const GamePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => GameBloc(), child: const _GameView());
  }
}
