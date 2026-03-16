import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.freezed.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  const factory GameEvent.loadGame() = LoadGame;
  const factory GameEvent.gameView() = GameView;
}
