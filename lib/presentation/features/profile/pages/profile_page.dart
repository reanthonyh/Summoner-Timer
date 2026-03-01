import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import '../widgets/game_grid.dart';

part 'profile_view.dart';

final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const ProfilePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => ProfileCubit(), child: const _ProfileView());
  }
}
