part of 'hide_and_seek.dart';

/// {@template hide_and_seek_cubit}
/// A [Cubit] for Game. -feature.
///
/// This cubit is responsible for
/// playing a simple hide and seek game
///
/// {@endtemplate}
class HideAndSeekCubit extends Cubit<HideAndSeekState> {
  /// {@macro hide_and_seek_cubit}
  HideAndSeekCubit() : super(const HideAndSeekState());

  /// Initializes the [HideAndSeekCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: HideAndSeekStatus.idle,
      ),
    );
  }
}
