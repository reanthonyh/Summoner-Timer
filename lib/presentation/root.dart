import 'package:flutter/material.dart';
import 'package:summoner_timer/core/theme/theme.dart';
import 'package:summoner_timer/l10n/l10n.dart';

import './features/search/page/search_page.dart';
import './features/profile/page/profile_page.dart';
import './features/game/page/game_page.dart';

final class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
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
