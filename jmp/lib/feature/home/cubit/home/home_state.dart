part of 'home.dart';

/// {@template home_state}
/// The state of [HomeCubit].
/// {@endtemplate}
@freezed
class HomeState with _$HomeState {
  /// {@macro home_state}
  const factory HomeState({
    @Default(HomeStatus.initializing)
        HomeStatus status,
  }) = _HomeState;
}

/// {@template home_status}
/// A status for [HomeState]. This status indicates
/// different states of the [HomeCubit].
/// {@endtemplate}
enum HomeStatus {
  /// {@macro home_status}
  ///
  /// The [HomeCubit] is currently being initialized
  initializing,

  /// {@macro home_status}
  ///
  /// The [HomeCubit] is not currently doing anything.
  idle,

  /// {@macro home_status}
  ///
  /// The [HomeCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro home_status}
  ///
  /// The [HomeCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro home_status}
  ///
  /// The [HomeCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
