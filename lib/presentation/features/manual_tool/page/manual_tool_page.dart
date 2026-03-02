import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/summoner_spell.dart';
import 'package:summoner_timer/presentation/features/manual_tool/cubit/manual_tool_cubit.dart';
import 'package:summoner_timer/presentation/features/manual_tool/cubit/manual_tool_state.dart';
import 'package:summoner_timer/presentation/features/profile/widgets/summoner_spell_box.dart';

part 'manual_tool_view.dart';

final class ManualToolPage extends StatelessWidget {
  const ManualToolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => ManualToolCubit(), child: const _ManualToolView());
  }
}
