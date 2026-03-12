import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';

import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({required GetCurrentGameUseCase getCurrentGameUseCase})
    : _getCurrentGameUseCase = getCurrentGameUseCase,
      super(const GameState.initial());

  final GetCurrentGameUseCase _getCurrentGameUseCase;

  Future<void> fetchCurrentGame() async {
    emit(const GameState.loading());
    try {
      final gameInfo = await _getCurrentGameUseCase();
      emit(GameState.loaded(gameInfo));
    } catch (e) {
      emit(GameState.error(e.toString()));
    }
  }
}
