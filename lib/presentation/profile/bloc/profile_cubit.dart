import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required SessionRepository sessionRepository})
    : _sessionRepository = sessionRepository,
      super(const ProfileState.initial()) {
    checkCurrentAccount();
  }

  final SessionRepository _sessionRepository;

  void checkCurrentAccount() {
    final account = _sessionRepository.currentAccount;
    if (account != null) {
      emit(ProfileState.loaded(account));
    } else {
      emit(const ProfileState.initial());
    }
  }

  void logout() {
    _sessionRepository.clear();
    emit(const ProfileState.initial());
  }
}
