part of 'menu.dart';

/// {@template menu_state}
/// The state of [MenuCubit].
/// {@endtemplate}
@freezed
class MenuState with _$MenuState {
  /// {@macro menu_state}
  const factory MenuState({
    @Default(MenuStatus.initializing)
        MenuStatus status,
  }) = _MenuState;
}

/// {@template menu_status}
/// A status for [MenuState]. This status indicates
/// different states of the [MenuCubit].
/// {@endtemplate}
enum MenuStatus {
  /// {@macro menu_status}
  ///
  /// The [MenuCubit] is currently being initialized
  initializing,

  /// {@macro menu_status}
  ///
  /// The [MenuCubit] is not currently doing anything.
  idle,

  /// {@macro menu_status}
  ///
  /// The [MenuCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro menu_status}
  ///
  /// The [MenuCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro menu_status}
  ///
  /// The [MenuCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
