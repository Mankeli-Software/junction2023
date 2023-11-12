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

  Timer? _durationTimer;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  static const _treshold = 30.0;

  /// Initializes the [ActionGameCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.
    _durationTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final duration = state.timeLeft - const Duration(seconds: 1);

      emit(
        state.copyWith(
          timeLeft: duration,
        ),
      );
    });

    _accelerometerSubscription = accelerometerEvents.listen((event) async {
      final total = event.x + event.y + event.z;

      if (total > _treshold) {
        final newProgress = state.currentProgress + 1;
        if ((await Vibration.hasVibrator()) ?? false) {
          await Vibration.vibrate(
            amplitude: 100,
            duration: 100,
          );
        }
        await Vibration.vibrate();
        emit(
          state.copyWith(
            currentProgress: min(
              newProgress,
              state.requiredProgress,
            ),
            status: newProgress >= state.requiredProgress ? ActionGameStatus.success : ActionGameStatus.idle,
          ),
        );
      }
    });

    emit(
      state.copyWith(
        status: ActionGameStatus.idle,
      ),
    );
  }

  @override
  Future<void> close() {
    _durationTimer?.cancel();

    _accelerometerSubscription?.cancel();

    return super.close();
  }
}
