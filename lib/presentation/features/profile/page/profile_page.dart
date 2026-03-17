import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/theme/theme.dart';
import 'package:summoner_timer/l10n/l10n.dart';
import 'package:summoner_timer/presentation/features/game/page/game_page.dart';
import 'package:summoner_timer/presentation/features/search/page/search_page.dart';

import '../cubit/cubit.dart';

part 'profile_view.dart';

final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static String get routeName => 'profile';

  static Route route() => MaterialPageRoute(builder: (context) => const ProfilePage());

  static MapEntry<String, WidgetBuilder> get routeEntry =>
      MapEntry(routeName, (context) => const ProfilePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit(), child: const _ProfileView());
  }
}
