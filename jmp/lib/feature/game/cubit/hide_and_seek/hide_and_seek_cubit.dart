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
  HideAndSeekCubit({
    required this.databaseRepository,
  }) : super(const HideAndSeekState());

  /// The repo to fetch stuff from firebase
  final DatabaseRepository databaseRepository;

  StreamSubscription<List<HideAndSeekEvent>>? _hideAndSeekEventSubscription;

  StreamSubscription<GameState>? _gameStateSubscription;

  StreamSubscription<CompassEvent>? _compassEventSubscription;

  Timer? _locationUpdateTimer;

  Timer? _countdownUpdateTimer;

  /// Initializes the [HideAndSeekCubit] by:
  /// x, y and z
  Future<void> initialize(String sessionId, User user) async {
    /// Add initializing steps here.
    _hideAndSeekEventSubscription = databaseRepository
        .getHideAndSeekEvents(sessionId)
        .listen((hideAndSeekEvents) {
      hideAndSeekEvents.forEach(handleEvent);
    });

    _gameStateSubscription =
        databaseRepository.getGameState(sessionId).listen((gameState) {
      if (gameState is HideAndSeekGameState) {
        emit(
          state.copyWith(
            state: gameState,
          ),
        );
      }
    });

    _compassEventSubscription = FlutterCompass.events?.listen((e) {
      emit(
        state.copyWith(
          compassEvent: e,
        ),
      );
    });

    _locationUpdateTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) async {
        final position = await Geolocator.getCurrentPosition();
        emit(
          state.copyWith(
            ownLocation: LatLng(
              position.latitude,
              position.longitude,
            ),
          ),
        );

        await databaseRepository.updatePlayerData(
          HideAndSeekPlayerData(
            playerId: user.id!,
            role: HideAndSeekRole.seeker,
            location: GeoPoint(
              position.latitude,
              position.longitude,
            ),
          ),
          sessionId,
        );

        if (state.state?.isSeeker(user) ?? false) {
          final latlong = LatLng(position.latitude, position.longitude);
          const dist = Distance();
          final prev = state.distanceToClosest;
          final closest = state.state?.playerData.fold<double?>(
            null,
            (prev, curr) {
              final currLatLng = curr.location != null
                  ? LatLng(
                      curr.location!.latitude,
                      curr.location!.longitude,
                    )
                  : null;

              final cDist = currLatLng != null
                  ? dist.as(LengthUnit.Meter, currLatLng, latlong)
                  : null;

              if (prev == null) {
                return cDist;
              }

              return min(prev, cDist ?? 1000);
            },
          );
          const tresholds = [500, 300, 100, 50];

          if (closest != null) {
            tresholds.map((t) async {
              if ((prev < t && t < closest) || (closest < t && t < prev)) {
                if ((await Vibration.hasVibrator()) ?? false) {
                  final index = tresholds.indexOf(t);

                  await Vibration.vibrate(
                    amplitude: 100,
                    duration: (index + 1) * 100,
                  );
                }
              }
            });
            emit(
              state.copyWith(
                distanceToClosest: closest,
              ),
            );
          }
        }
      },
    );
  }

  /// Starts the game
  Future<void> startGame() async {
    final playerData = state.state!.playerData
        .map(
          (pd) => pd.copyWith(
            role: HideAndSeekRole.hider,
          ),
        )
        .toList();

    final random = Random();

    final ranIndex = random.nextInt(playerData.length);

    playerData[ranIndex] = playerData[ranIndex].copyWith(
      role: HideAndSeekRole.seeker,
    );

    final newState = state.state!.copyWith(
      status: GameStatus.playing,
      playerData: playerData,
    );

    await databaseRepository.updateGameState(newState);
    await databaseRepository.addHideAndSeekEvent(
      const HideAndSeekEvent.startCountdown(),
      newState.sessionId!,
    );

    final countdown = const Duration(
      seconds: 20,
    );

    _countdownUpdateTimer =
        Timer.periodic(const Duration(seconds: 1), (_) async {
      final newCountdown = state.seekerCountdown - const Duration(seconds: 1);

      if (newCountdown.isNegative) {
        _countdownUpdateTimer?.cancel();
        _countdownUpdateTimer = null;
        emit(
          state.copyWith(
            seekerCountdown: Duration.zero,
            status: HideAndSeekStatus.searching,
          ),
        );
        await databaseRepository.addHideAndSeekEvent(
          const HideAndSeekEvent.endCountdown(),
          newState.sessionId!,
        );
      }
    });

    emit(
      state.copyWith(
        state: newState,
        status: HideAndSeekStatus.counting,
        seekerCountdown: countdown,
      ),
    );
  }

  /// Handle single [HideAndSeekEvent]
  Future<void> handleEvent(HideAndSeekEvent event) async {
    await event.when(
      revealLocation: (revealId) async {
        final playerData = state.state?.playerData
            .where((p) => p.playerId == revealId)
            .firstOrNull;

        if (playerData != null) {
          final location = playerData.location;
          if (location == null) {
            return;
          }

          final latlong = LatLng(
            playerData.location!.latitude,
            playerData.location!.longitude,
          );

          emit(
            state.copyWith(
              showLocations: [
                latlong,
              ],
            ),
          );

          if ((await Vibration.hasVibrator()) ?? false) {
            await Vibration.vibrate(
              amplitude: 100,
              duration: 100,
            );
          }

          Timer(
            const Duration(seconds: 5),
            () {
              emit(
                state.copyWith(
                  showLocations: [],
                ),
              );
            },
          );
        }
      },
      startCountdown: () {
        emit(
          state.copyWith(
            status: HideAndSeekStatus.counting,
          ),
        );
      },
      endCountdown: () {
        emit(
          state.copyWith(
            status: HideAndSeekStatus.searching,
          ),
        );
      },
      endGame: () {
        emit(
          state.copyWith(
            status: HideAndSeekStatus.finished,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _hideAndSeekEventSubscription?.cancel();
    _gameStateSubscription?.cancel();
    _locationUpdateTimer?.cancel();
    _compassEventSubscription?.cancel();

    return super.close();
  }
}
