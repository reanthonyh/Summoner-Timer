import 'package:summoner_timer/domain/entities/entities.dart';

abstract class LiveGameEvent {
  const LiveGameEvent();
}

class LoadLiveGameEvent extends LiveGameEvent {
  const LoadLiveGameEvent();
}

abstract class LiveGameState {
  const LiveGameState();
}

class LiveGameInitial extends LiveGameState {}

class LiveGameLoading extends LiveGameState {}

class LiveGameLoaded extends LiveGameState {
  const LiveGameLoaded({required this.gameInformation});

  final GameInformation gameInformation;
}

class LiveGameError extends LiveGameState {
  const LiveGameError({required this.message});

  final String message;
}

class LiveGameNotFound extends LiveGameState {}
