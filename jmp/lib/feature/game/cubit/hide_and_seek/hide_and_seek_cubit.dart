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

  StreamSubscription<CompassEvent>? _compassEventSubscription;

  /// Initializes the [HideAndSeekCubit] by:
  /// x, y and z
  Future<void> initialize() async {
    /// Add initializing steps here.

    _compassEventSubscription = FlutterCompass.events?.listen((e) {
      emit(
        state.copyWith(
          compassEvent: e,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _compassEventSubscription?.cancel();

    return super.close();
  }
}
