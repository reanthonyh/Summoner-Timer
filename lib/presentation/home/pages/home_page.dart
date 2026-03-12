import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/presentation/home/cubit/home_cubit.dart';
import 'package:summoner_timer/presentation/home/cubit/home_state.dart';
import 'package:summoner_timer/presentation/profile/bloc/profile_cubit.dart';
import 'package:summoner_timer/presentation/profile/pages/profile_page.dart';
import 'package:summoner_timer/presentation/search/pages/search_page.dart';
import 'package:summoner_timer/presentation/search/bloc/search_cubit.dart';
import 'package:summoner_timer/presentation/search/bloc/search_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavigationTapped(int index) {
    if (index == 1) {
      context.read<ProfileCubit>().checkCurrentAccount();
    }
    context.read<HomeCubit>().setTab(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (account) {
            context.read<ProfileCubit>().checkCurrentAccount();
            _onNavigationTapped(1);
          },
        );
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF151515),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [SearchPage(), ProfilePage()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF111111),
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.white54,
              currentIndex: state.currentIndex,
              onTap: _onNavigationTapped,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
              ],
            ),
          );
        },
      ),
    );
  }
}
