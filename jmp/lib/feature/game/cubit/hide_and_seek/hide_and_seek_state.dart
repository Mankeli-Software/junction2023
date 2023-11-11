part of 'hide_and_seek.dart';

/// {@template hide_and_seek_state}
/// The state of [HideAndSeekCubit].
/// {@endtemplate}
@freezed
class HideAndSeekState with _$HideAndSeekState {
  /// {@macro hide_and_seek_state}
  const factory HideAndSeekState({
    @Default(HideAndSeekStatus.initializing)
        HideAndSeekStatus status,
  }) = _HideAndSeekState;
}

/// {@template hide_and_seek_status}
/// A status for [HideAndSeekState]. This status indicates
/// different states of the [HideAndSeekCubit].
/// {@endtemplate}
enum HideAndSeekStatus {
  /// {@macro hide_and_seek_status}
  ///
  /// The [HideAndSeekCubit] is currently being initialized
  initializing,

  /// {@macro hide_and_seek_status}
  ///
  /// The [HideAndSeekCubit] is not currently doing anything.
  idle,

  /// {@macro hide_and_seek_status}
  ///
  /// The [HideAndSeekCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro hide_and_seek_status}
  ///
  /// The [HideAndSeekCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro hide_and_seek_status}
  ///
  /// The [HideAndSeekCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
