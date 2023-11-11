part of 'join_game.dart';

/// {@template join_game_cubit}
/// A [Cubit] for Game. -feature.
///
/// This cubit is responsible for
/// displaying qr-code reader
///
/// {@endtemplate}
class JoinGameCubit extends Cubit<JoinGameState> {
  /// {@macro join_game_cubit}
  JoinGameCubit() : super(const JoinGameState());

  /// Initializes the [JoinGameCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: JoinGameStatus.idle,
        readerStatus: ReaderStaus.scanning,
      ),
    );
  }

  /// Action on code
  void onCode() {
    emit(
      state.copyWith(
        readerStatus: ReaderStaus.codeReadSuccess,
      ),
    );
  }
}
