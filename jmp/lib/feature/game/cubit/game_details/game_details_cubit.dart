part of 'game_details.dart';

/// {@template game_details_cubit}
/// A [Cubit] for Game. -feature.
///
/// This cubit is responsible for
/// displaying details of a game
///
/// {@endtemplate}
class GameDetailsCubit extends Cubit<GameDetailsState> {
  /// {@macro game_details_cubit}
  GameDetailsCubit() : super(const GameDetailsState());

  /// Initializes the [GameDetailsCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: GameDetailsStatus.idle,
      ),
    );
  }

  /// Sets the scroll offset
  void setScrollOffset(double offset) {
    emit(
      state.copyWith(
        // scrollOffset: offset,
        titleIsDown: offset < 300,
      ),
    );
  }
}
