import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/features/profile/pages/profile_page.dart';

import 'package:summoner_timer/core/constants/enums.dart';

import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

part 'search_view.dart';

final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => SearchCubit(), child: _SearchView());
  }
}
