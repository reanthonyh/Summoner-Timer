import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/presentation/features/home/cubit/home_cubit.dart';
import 'package:summoner_timer/presentation/features/home/cubit/home_state.dart';
import 'package:summoner_timer/presentation/features/manual_tool/page/manual_tool_page.dart';
import 'package:summoner_timer/presentation/features/search/page/search_page.dart';

part 'home_view.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: _HomeView());
  }
}
