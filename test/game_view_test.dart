import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:summoner_timer_app/presentation/features/game/page/game_page.dart';
import 'package:summoner_timer_app/presentation/features/game/bloc/game_bloc.dart';
import 'package:summoner_timer_app/presentation/features/game/bloc/game_event.dart';
import 'package:summoner_timer_app/presentation/features/game/bloc/game_state.dart';

void main() {
  testWidgets('GameView has Scaffold with AppBar and Body', (WidgetTester tester) async {
    await tester.pumpWidget(const GamePage());
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(GameBody), findsOneWidget);
  });

  testWidgets('GameAppBar contains title', (WidgetTester tester) async {
    await tester.pumpWidget(const GamePage());
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
  });
}