import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setTab(HomeTab tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
