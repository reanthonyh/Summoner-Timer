import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

import 'profile_state.dart';

final class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial()) {
    _fetchData();
  }

  final _getAccountSession = getIt<GetCurrentAccountUseCase>();
  final _logoutUseCase = getIt<LogoutUseCase>();

  void logout() {
    _logoutUseCase();
    emit(state.copyWith(status: .initial, account: null));
  }

  void _fetchData() {
    emit(state.copyWith(status: .loading));

    final account = _getAccountSession();

    if (account == null) {
      emit(state.copyWith(status: .error, message: "Not Account Selected"));
    }

    emit(state.copyWith(status: .success, account: account));
  }
}
