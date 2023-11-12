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

  Timer? _countdownUpdateTimer;

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

  /// Starts the game
  void startGame() {
    const countdown = Duration(seconds: 20);
    _countdownUpdateTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final newCountdown = state.countingDuration - const Duration(seconds: 1);
      emit(
        state.copyWith(
          countingDuration: newCountdown,
          status: newCountdown.isNegative
              ? HideAndSeekStatus.searching
              : state.status,
        ),
      );
      if (newCountdown.isNegative) {
        _countdownUpdateTimer?.cancel();
      }
    });
    emit(
      state.copyWith(
        status: HideAndSeekStatus.counting,
        countingDuration: countdown,
      ),
    );
  }

  /// Sets the status
  void setStatus(HideAndSeekStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }

  @override
  Future<void> close() {
    _compassEventSubscription?.cancel();
    _countdownUpdateTimer?.cancel();

    return super.close();
  }
}
