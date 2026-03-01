import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/features/search/pages/search_page.dart';
import 'package:summoner_timer/presentation/core/theme/nexus_colors.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: NexusColors.background,
        colorScheme: ColorScheme.dark(
          primary: NexusColors.primary,
          surface: NexusColors.cardBackground,
          onSurface: NexusColors.textPrimary,
        ),
        fontFamily: 'Roboto', // Placeholder for tech font
        appBarTheme: const AppBarTheme(
          backgroundColor: NexusColors.background,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const SearchPage(),
    );
  }
}
