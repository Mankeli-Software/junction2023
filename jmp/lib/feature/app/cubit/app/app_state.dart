part of 'app.dart';

/// {@template app_state}
/// The state of the [AppCubit].
/// {@endtemplate}
@freezed
class AppState with _$AppState {
  /// {@macro app_state}
  const factory AppState({
    /// {@macro startup_logic_status}
    @Default(StartupLogicStatus.running) StartupLogicStatus startupLogicStatus,

    /// This is where we keep track of the current lifecycle state of the app. Whether we're in
    /// the foreground, background, or somewhere in between, this is the place to be.
    @Default(AppLifecycleState.detached) AppLifecycleState lifecycleState,
    @Default(User.empty) User currentUser,
  }) = _AppState;
}

/// {@template startup_logic_status}
/// This is where we keep track of whether the startup logic is still running or if it's all wrapped up and ready to go.
/// {@endtemplate}
enum StartupLogicStatus {
  /// We're in the thick of it! The startup logic is currently running, so we'll need to keep the loading screen
  /// up for a little bit longer. Hang tight, we'll be ready to roll in no time.
  running,

  /// And just like that, we're done with the startup logic! Time to say goodbye to the loading
  /// screen and hello to the main event. Let's get this app rolling!
  finished,
}
