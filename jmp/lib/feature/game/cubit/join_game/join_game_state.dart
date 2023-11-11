part of 'join_game.dart';

/// {@template join_game_state}
/// The state of [JoinGameCubit].
/// {@endtemplate}
@freezed
class JoinGameState with _$JoinGameState {
  /// {@macro join_game_state}
  const factory JoinGameState({
    @Default(JoinGameStatus.initializing) JoinGameStatus status,
    @Default(ReaderStaus.scanning) ReaderStaus readerStatus,
  }) = _JoinGameState;
}

/// {@template join_game_status}
/// A status for [JoinGameState]. This status indicates
/// different states of the [JoinGameCubit].
/// {@endtemplate}
enum JoinGameStatus {
  /// {@macro join_game_status}
  ///
  /// The [JoinGameCubit] is currently being initialized
  initializing,

  /// {@macro join_game_status}
  ///
  /// The [JoinGameCubit] is not currently doing anything.
  idle,

  /// {@macro join_game_status}
  ///
  /// The [JoinGameCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro join_game_status}
  ///
  /// The [JoinGameCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro join_game_status}
  ///
  /// The [JoinGameCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}

/// {@template ReaderStaus}
/// Status of the qr-code reader
/// {@endtemplate}
enum ReaderStaus {
  /// {@macro ReaderStaus}
  scanning,

  /// {@macro ReaderStaus}
  codeReadSuccess,

  /// {@macro ReaderStaus}
  error,
}
