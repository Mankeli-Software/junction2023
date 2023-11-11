part of 'game_menu.dart';

/// {@template game_menu_state}
/// The state of [GameMenuCubit].
/// {@endtemplate}
@freezed
class GameMenuState with _$GameMenuState {
  /// {@macro game_menu_state}
  const factory GameMenuState({
    @Default(GameMenuStatus.initializing)
        GameMenuStatus status,
  }) = _GameMenuState;
}

/// {@template game_menu_status}
/// A status for [GameMenuState]. This status indicates
/// different states of the [GameMenuCubit].
/// {@endtemplate}
enum GameMenuStatus {
  /// {@macro game_menu_status}
  ///
  /// The [GameMenuCubit] is currently being initialized
  initializing,

  /// {@macro game_menu_status}
  ///
  /// The [GameMenuCubit] is not currently doing anything.
  idle,

  /// {@macro game_menu_status}
  ///
  /// The [GameMenuCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro game_menu_status}
  ///
  /// The [GameMenuCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro game_menu_status}
  ///
  /// The [GameMenuCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
