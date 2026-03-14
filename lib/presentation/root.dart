import 'package:flutter/material.dart';
import 'package:summoner_timer/l10n/l10n.dart';

import './features/search/page/search_page.dart';
import './features/profile/page/profile_page.dart';
import './features/game/page/game_page.dart';

final class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: SearchPage.routeName,
      routes: Map.fromEntries([
        SearchPage.routeEntry,
        ProfilePage.routeEntry,
        GamePage.routeEntry,
      ]),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

abstract final class AppTheme {
  static const _wineSeed = Color(0xFF722F37);

  static ThemeData defaultTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _wineSeed,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _wineSeed,
        brightness: Brightness.dark,
      ),
    );
  }
}
