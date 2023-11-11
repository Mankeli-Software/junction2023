part of 'action_game.dart';

/// {@template action_game_cubit}
/// A [Cubit] for Minigame. -feature.
///
/// This cubit is responsible for
/// playing a simple action game with the user
///
/// {@endtemplate}
class ActionGameCubit extends Cubit<ActionGameState> {
  /// {@macro action_game_cubit}
  ActionGameCubit() : super(const ActionGameState());

  /// Initializes the [ActionGameCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: ActionGameStatus.idle,
      ),
    );
  }
}
