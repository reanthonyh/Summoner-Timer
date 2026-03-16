import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

import 'game_event.dart';
import 'game_state.dart';

final class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<LoadGame>(_onLoadGame);
    on<GameView>(_onGameView);
  }

  final _getCurrentGameUseCase = getIt<GetCurrentGameUseCase>();

  void _onLoadGame(LoadGame event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: .loading));
    final result = await _getCurrentGameUseCase();
  }

  void _onGameView(GameView event, Emitter<GameState> emit) {
    // Implementation for handling game view state
  }
}
