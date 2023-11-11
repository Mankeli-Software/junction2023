part of 'game_menu.dart';

/// {@template game_menu_cubit}
/// A [Cubit] for Home. -feature.
///
/// This cubit is responsible for
/// displaying all of the possible games
///
/// {@endtemplate}
class GameMenuCubit extends Cubit<GameMenuState> {
  /// {@macro game_menu_cubit}
  GameMenuCubit() : super(const GameMenuState());

  /// Initializes the [GameMenuCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: GameMenuStatus.idle,
      ),
    );
  }
}
