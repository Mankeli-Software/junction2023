part of 'balance_game.dart';

/// {@template balance_game_cubit}
/// A [Cubit] for Minigame. -feature.
///
/// This cubit is responsible for
/// playing a simple balancing game
///
/// {@endtemplate}
class BalanceGameCubit extends Cubit<BalanceGameState> {
  /// {@macro balance_game_cubit}
  BalanceGameCubit() : super(const BalanceGameState());

  /// Initializes the [BalanceGameCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: BalanceGameStatus.idle,
      ),
    );
  }
}
