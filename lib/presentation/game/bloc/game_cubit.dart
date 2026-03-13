import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/exceptions/exceptions.dart';
import 'package:summoner_timer/core/utils/result.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';

import 'game_state.dart';

final class GameCubit extends Cubit<GameState> {
  GameCubit({required GetCurrentGameUseCase getCurrentGameUseCase})
    : _getCurrentGameUseCase = getCurrentGameUseCase,
      super(const GameState.initial());

  final GetCurrentGameUseCase _getCurrentGameUseCase;

  Future<void> fetchCurrentGame() async {
    emit(const GameState.loading());

    final result = await _getCurrentGameUseCase();

    result.when(
      success: (gameInfo) {
        emit(GameState.loaded(gameInfo));
      },
      failure: (error) {
        if (error is ApiException) {
          emit(
            GameState.error(
              message: error.message,
              statusCode: error.statusCode,
              responseBody: error.responseBody,
              errorType: error.errorType,
            ),
          );
        } else {
          emit(GameState.error(message: error.toString()));
        }
      },
    );
  }
}
