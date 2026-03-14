import 'package:flutter/material.dart';

final class GamePage extends StatelessWidget {
  const GamePage({super.key});

  static String get routeName => 'game';

  static Route route() => MaterialPageRoute(builder: (context) => const GamePage());

  static MapEntry<String, WidgetBuilder> get routeEntry =>
      MapEntry(routeName, (context) => const GamePage());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
