import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/constants/enums.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';

import 'profile_state.dart';

final class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial()) {
    _fetchData();
  }

  final _sessionRepository = getIt<SessionRepository>();
  final _getCurrentGameUC = getIt<GetCurrentGameUseCase>();

  Future<void> _fetchData() async {
    final account = _sessionRepository.currentAccount;

    // We can emit the account immediately since it's in session
    emit(state.copyWith(account: account, status: UiStatus.loading));

    try {
      final gameInformation = await _getCurrentGameUC.call();
      emit(state.copyWith(status: UiStatus.success, gameInformation: gameInformation));
    } catch (err) {
      emit(state.copyWith(status: UiStatus.error));
    }
  }
}
