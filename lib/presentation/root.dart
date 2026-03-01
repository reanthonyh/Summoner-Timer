import 'package:flutter/material.dart';
import 'package:summoner_timer/presentation/features/search/pages/search_page.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: .dark),
      ),
      home: const SearchPage(),
    );
  }
}
