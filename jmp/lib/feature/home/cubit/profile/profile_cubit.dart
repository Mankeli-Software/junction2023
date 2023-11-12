part of 'profile.dart';

/// {@template profile_cubit}
/// A [Cubit] for Home. -feature.
///
/// This cubit is responsible for
/// viewing and editing user profile
///
/// {@endtemplate}
class ProfileCubit extends Cubit<ProfileState> {
  /// {@macro profile_cubit}
  ProfileCubit() : super(const ProfileState());

  /// Initializes the [ProfileCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: ProfileStatus.idle,
      ),
    );
  }
}
