import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/presentation/home/cubit/home_cubit.dart';
import 'package:summoner_timer/presentation/home/pages/home_page.dart';
import 'package:summoner_timer/presentation/profile/bloc/profile_cubit.dart';
import 'package:summoner_timer/presentation/search/bloc/search_cubit.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summoner Timer',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color(0xFF151515)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeCubit()),
          BlocProvider(
            create: (_) => SearchCubit(
              getAccountUseCase: getIt(),
              getSavedAccountsUseCase: getIt(),
              saveAccountUseCase: getIt(),
            ),
          ),
          BlocProvider(create: (_) => ProfileCubit(sessionRepository: getIt())),
        ],
        child: const HomePage(),
      ),
    );
  }
}
