import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeTab { search, manualTool }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({@Default(HomeTab.search) HomeTab currentTab}) = _HomeState;
}
