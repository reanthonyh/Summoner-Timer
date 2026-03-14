import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/l10n/l10n.dart';
import 'package:summoner_timer/presentation/features/profile/page/profile_page.dart';

import '../cubit/cubit.dart';

part 'search_view.dart';

final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static String get routeName => 'search';

  static Route route() => MaterialPageRoute(builder: (context) => const SearchPage());

  static MapEntry<String, WidgetBuilder> get routeEntry =>
      MapEntry(routeName, (context) => const SearchPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchFormCubit()),
        BlocProvider(create: (context) => RecentAccountsCubit()),
      ],
      child: const _SearchView(),
    );
  }
}
