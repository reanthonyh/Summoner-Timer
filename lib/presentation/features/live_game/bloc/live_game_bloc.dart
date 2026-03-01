import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/usecases/get_current_game_usecase.dart';
import 'live_game_event_state.dart';

final class LiveGameBloc extends Bloc<LiveGameEvent, LiveGameState> {
  LiveGameBloc({required GetCurrentGameUseCase getCurrentGameUseCase})
    : _getCurrentGameUseCase = getCurrentGameUseCase,
      super(LiveGameInitial()) {
    on<LoadLiveGameEvent>(_onLoadLiveGame);
  }

  final GetCurrentGameUseCase _getCurrentGameUseCase;

  Future<void> _onLoadLiveGame(
    LoadLiveGameEvent event,
    Emitter<LiveGameState> emit,
  ) async {
    emit(LiveGameLoading());
    try {
      final gameInformation = await _getCurrentGameUseCase();
      emit(LiveGameLoaded(gameInformation: gameInformation));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains('404') || errorMessage.contains('not found')) {
        emit(LiveGameNotFound());
      } else {
        emit(LiveGameError(message: errorMessage));
      }
    }
  }
}
