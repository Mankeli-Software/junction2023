part of 'game_details.dart';

/// {@template game_details_state}
/// The state of [GameDetailsCubit].
/// {@endtemplate}
@freezed
class GameDetailsState with _$GameDetailsState {
  /// {@macro game_details_state}
  const factory GameDetailsState({
    @Default(GameDetailsStatus.initializing) GameDetailsStatus status,
    @Default(0) double? scrollOffset,
    @Default(true) bool titleIsDown,
  }) = _GameDetailsState;
}

/// {@template game_details_status}
/// A status for [GameDetailsState]. This status indicates
/// different states of the [GameDetailsCubit].
/// {@endtemplate}
enum GameDetailsStatus {
  /// {@macro game_details_status}
  ///
  /// The [GameDetailsCubit] is currently being initialized
  initializing,

  /// {@macro game_details_status}
  ///
  /// The [GameDetailsCubit] is not currently doing anything.
  idle,

  /// {@macro game_details_status}
  ///
  /// The [GameDetailsCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro game_details_status}
  ///
  /// The [GameDetailsCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro game_details_status}
  ///
  /// The [GameDetailsCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
