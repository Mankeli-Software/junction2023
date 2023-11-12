part of 'balance_game.dart';

/// {@template balance_game_state}
/// The state of [BalanceGameCubit].
/// {@endtemplate}
@freezed
class BalanceGameState with _$BalanceGameState {
  /// {@macro balance_game_state}
  const factory BalanceGameState({
    @Default(BalanceGameStatus.initializing)
        BalanceGameStatus status,
  }) = _BalanceGameState;
}

/// {@template balance_game_status}
/// A status for [BalanceGameState]. This status indicates
/// different states of the [BalanceGameCubit].
/// {@endtemplate}
enum BalanceGameStatus {
  /// {@macro balance_game_status}
  ///
  /// The [BalanceGameCubit] is currently being initialized
  initializing,

  /// {@macro balance_game_status}
  ///
  /// The [BalanceGameCubit] is not currently doing anything.
  idle,

  /// {@macro balance_game_status}
  ///
  /// The [BalanceGameCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro balance_game_status}
  ///
  /// The [BalanceGameCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro balance_game_status}
  ///
  /// The [BalanceGameCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
