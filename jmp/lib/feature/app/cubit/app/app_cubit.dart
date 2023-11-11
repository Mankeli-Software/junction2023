part of 'app.dart';

/// {@template app_cubit}
/// This cubit handles the running of startup logic. It's responsible for making sure all the necessary
/// setup happens before we can fully enjoy the app. We're talking initializing services,
/// handling permissions, and all that jazz.
/// {@endtemplate}
class AppCubit extends Cubit<AppState> {
  /// {@macro app_cubit}
  AppCubit({
    required this.flavor,
    required this.router,
    required this.databaseRepository,
    required this.analyticRepository,
    required this.permissionRepository,
    required this.cacheRepository,
    required this.cloudFunctionRepository,
    required this.storageRepository,
    required this.authenticationRepository,
    required this.notificationRepository,
    required this.deepLinkRepository,
  })  : repositories = [
          databaseRepository,
          analyticRepository,
          permissionRepository,
          cacheRepository,
          cloudFunctionRepository,
          storageRepository,
          authenticationRepository,
          notificationRepository,
          deepLinkRepository,
        ],
        super(const AppState());

  /// {@macro app_cubit}
  final Flavor flavor;

  /// {@macro app_cubit}
  final StackRouter router;

  /// {@macro app_cubit}
  final DatabaseRepository databaseRepository;

  /// {@macro app_cubit}
  final AnalyticRepository analyticRepository;

  /// {@macro app_cubit}
  final PermissionRepository permissionRepository;

  /// {@macro app_cubit}
  final CacheRepository cacheRepository;

  /// {@macro app_cubit}
  final CloudFunctionRepository cloudFunctionRepository;

  /// {@macro app_cubit}
  final StorageRepository storageRepository;

  /// {@macro app_cubit}
  final AuthenticationRepository authenticationRepository;

  /// {@macro app_cubit}
  final NotificationRepository notificationRepository;

  /// {@macro app_cubit}
  final DeepLinkRepository deepLinkRepository;

  StreamSubscription<User>? _authChangeSubscription;

  StreamSubscription<User>? _notificationTokenSubscription;

  /// {@macro app_cubit}
  @visibleForTesting
  final List<Repository> repositories;

  StreamSubscription<DeepLink>? _deepLinkSubscription;

  StreamSubscription<PushNotification>? _notificationSubscription;

  /// Initializes the cubit
  Future<void> initialize() async {
    AppLogger.d('initializing');

    analyticRepository.logAppOpen();

    await Future.wait<void>(repositories.map((r) => r.initialize()));

    await handlePushNotificationPermission();

    analyticRepository.logStartupLogicComplete();

    emit(
      state.copyWith(
        startupLogicStatus: StartupLogicStatus.finished,
      ),
    );

    _deepLinkSubscription = deepLinkRepository.deepLinks.listen(
      (deepLink) {
        AppLogger.d('Deep link received: $deepLink');
        deepLink.remoteAction.handle(router);
      },
    );

    _authChangeSubscription = authenticationRepository.authChanges
        .asyncMap(databaseRepository.ensureUserInitialized)
        .listen(
      (user) {
        emit(
          state.copyWith(
            currentUser: user,
          ),
        );
      },
    );

    _notificationSubscription = notificationRepository.notifications.listen(
      (notification) {
        AppLogger.d('Notification received: $notification');
        notification.remoteAction.handle(router);
      },
    );

    _notificationTokenSubscription = notificationRepository.tokenChanges
        .map<User>((t) {
          final tokens = state.currentUser.notificationTokens ?? [];

          if (tokens.contains(t.token)) {
            return state.currentUser;
          }

          return state.currentUser.copyWith(
            notificationTokens: [...tokens, t.token],
          );
        })
        .asyncMap(databaseRepository.ensureUserInitialized)
        .listen((user) {
          emit(
            state.copyWith(
              currentUser: user,
            ),
          );
        });
    await notificationRepository.allowInAppMessages();
  }

  /// This is where we set the current app lifecycle. Whether we're in the foreground,
  /// background, or somewhere in between, this is where we keep track of it all.
  Future<void> setLifecycleState(AppLifecycleState lifecycleState) {
    AppLogger.d('Changing lifecycle state to $state');
    emit(
      state.copyWith(
        lifecycleState: lifecycleState,
      ),
    );

    return Future.value();
  }

  /// This is where we handle all the nitty-gritty details of sending push notifications.
  /// Whether we're granting access or denying it, this is where it all goes down.
  @visibleForTesting
  Future<void> handlePushNotificationPermission() async {
    AppLogger.d('Handling push notification permission');

    if (!databaseRepository.hasPromptedNotificationPermissions()) {
      await notificationRepository.requestPermission();
      await databaseRepository.setNotificationPermissionsPrompted();
    }
  }

  @override
  Future<void> close() async {
    await _deepLinkSubscription?.cancel();

    await _notificationSubscription?.cancel();

    await _authChangeSubscription?.cancel();

    await _notificationTokenSubscription?.cancel();

    ///
    await Future.wait(repositories.map((r) => r.dispose()));

    return super.close();
  }
}
