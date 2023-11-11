part of 'profile.dart';

/// {@template profile_state}
/// The state of [ProfileCubit].
/// {@endtemplate}
@freezed
class ProfileState with _$ProfileState {
  /// {@macro profile_state}
  const factory ProfileState({
    @Default(ProfileStatus.initializing)
        ProfileStatus status,
  }) = _ProfileState;
}

/// {@template profile_status}
/// A status for [ProfileState]. This status indicates
/// different states of the [ProfileCubit].
/// {@endtemplate}
enum ProfileStatus {
  /// {@macro profile_status}
  ///
  /// The [ProfileCubit] is currently being initialized
  initializing,

  /// {@macro profile_status}
  ///
  /// The [ProfileCubit] is not currently doing anything.
  idle,

  /// {@macro profile_status}
  ///
  /// The [ProfileCubit] is doing some loading, calling
  /// repositories etc.
  busy,

  /// {@macro profile_status}
  ///
  /// The [ProfileCubit] has completed its task successfully
  /// and is not currently doing anything.
  success,

  /// {@macro profile_status}
  ///
  /// The [ProfileCubit] has completed its task with a failure
  /// and is not currently doing anything.
  failure,
}
