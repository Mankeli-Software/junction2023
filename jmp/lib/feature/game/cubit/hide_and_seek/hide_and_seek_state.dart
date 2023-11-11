part of 'hide_and_seek.dart';

/// {@template hide_and_seek_state}
/// The state of [HideAndSeekCubit].
/// {@endtemplate}
@freezed
class HideAndSeekState with _$HideAndSeekState {
  /// {@macro hide_and_seek_state}
  const factory HideAndSeekState({
    @Default(HideAndSeekStatus.lobby) HideAndSeekStatus status,
    HideAndSeekGameState? state,
    CompassEvent? compassEvent,
    @Default([]) List<LatLng> showLocations,
    @Default(Duration.zero) Duration seekerCountdown,
    LatLng? ownLocation,
    @Default(1000) double distanceToClosest,
  }) = _HideAndSeekState;
}

/// {@template hide_and_seek_status}
/// A status for [HideAndSeekState]. This status indicates
/// different states of the [HideAndSeekCubit].
/// {@endtemplate}
enum HideAndSeekStatus {
  /// {@macro hide_and_seek_status}
  lobby,

  /// {@macro hide_and_seek_status}
  counting,

  /// {@macro hide_and_seek_status}
  searching,

  /// {@macro hide_and_seek_status}
  finished,
}
