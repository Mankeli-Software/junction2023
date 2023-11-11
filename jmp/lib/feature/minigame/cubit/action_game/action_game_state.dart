part of 'action_game.dart';

/// {@template action_game_state}
/// The state of [ActionGameCubit].
/// {@endtemplate}
@freezed
class ActionGameState with _$ActionGameState {
  /// {@macro action_game_state}
  const factory ActionGameState({
    @Default(ActionGameStatus.initializing)
        ActionGameStatus status,
  }) = _ActionGameState;
}

/// {@template action_game_status}
/// A status for [ActionGameState]. This status indicates
/// different states of the [ActionGameCubit].
/// {@endtemplate}
enum ActionGameStatus {
  /// {@macro action_game_status}
  ///
  /// The [ActionGameCubit] is currently being initialized
  initializing,

  /// {@macro action_game_status}
  ///
  /// The [ActionGameCubit] is not currently doing anything.
  idle,

  /// {@macro action_game_status}
  ///
  /// The [ActionGameCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro action_game_status}
  ///
  /// The [ActionGameCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro action_game_status}
  ///
  /// The [ActionGameCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
