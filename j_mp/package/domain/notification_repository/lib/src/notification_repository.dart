import 'dart:async';

import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';
import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';

/// {@template notifications_repository}
/// A repository which manages all interactions with notifications. Uses Firebase Cloud Messaging and Firebase In App Messaging.
/// {@endtemplate}
class NotificationRepository extends Repository {
  /// {@macro notifications_repository}
  NotificationRepository()
      : _firebaseMessaging = FirebaseMessaging.instance,
        _firebaseInAppMessaging = FirebaseInAppMessaging.instance;

  /// {@macro notifications_repository}
  @visibleForTesting
  NotificationRepository.mockable({
    required FirebaseMessaging firebaseMessaging,
    required FirebaseInAppMessaging firebaseInAppMessaging,
  })  : _firebaseMessaging = firebaseMessaging,
        _firebaseInAppMessaging = firebaseInAppMessaging;

  late final FirebaseMessaging _firebaseMessaging;
  late final FirebaseInAppMessaging _firebaseInAppMessaging;

  StreamSubscription<String>? _tokenSubscription;
  StreamSubscription<RemoteMessage>? _messageSubscription;

  final StreamController<NotificationToken> _tokenController =
      StreamController.broadcast();

  final StreamController<PushNotification> _notificationController =
      StreamController.broadcast();

  /// A stream which emits a new notification token is received.
  Stream<NotificationToken> get tokenChanges => _tokenController.stream;

  /// A stream which emits  new notification is received.
  Stream<PushNotification> get notifications => _notificationController.stream;

  /// Initializes the repository. IMPORTANT: This must be called before accessing the other methods in this repository.
  @override
  Future<void> initialize({
    /// For testing purposes only.
    ///
    /// {@macro is_test_mode}
    @visibleForTesting bool isTestMode = false,

    /// Whether in app messages should be deferred by default or not.
    bool deferInAppMessagesByDefault = true,
  }) async {
    await _firebaseInAppMessaging.setAutomaticDataCollectionEnabled(true);
    if (deferInAppMessagesByDefault) await deferInAppMessages();

    // This stream gives us the token we can use to send notifications to this device.
    _tokenSubscription = _firebaseMessaging.onTokenRefresh.listen(handleToken);

    /// Gets the initial token and handles it
    final token = await _firebaseMessaging.getToken();
    await handleToken(token);

    /// Gets the initial message and handles it. Initial messages are given, when the user
    /// opens the app by tapping on a notification.
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      await handleNotification(
        initialMessage,
        type: PushNotificationType.initial,
      );
    }

    /// {@template is_test_mode}
    /// The initialize method calls static methods on FirebaseMessaging and FirebaseInAppMessaging.
    /// This is not possible to test. One workaround for testing static methods is explained here:
    /// https://github.com/dart-lang/mockito/issues/214#issuecomment-523662502
    /// However, given the nature of these methods we would need to mock, we cannot use this workaround.
    /// There is a very good reason why those methods are static: they need to remain in memory even after
    /// garbage collection (which static methods do). This is because they are used to handle background notifications.
    /// Thus the ugly workaround of using test related code in the repository itself.
    /// {@endtemplate}
    if (isTestMode) return;

    // This stream gives us the messages that are received when the app is in the foreground.
    _messageSubscription = FirebaseMessaging.onMessage.listen(
      handleNotification,
    );

    // Initializes the method for handling background notifications.
    // This allows us to run some code in the background every time the app receives
    // a push notification and the app is in background or closed (even if the user
    // does not press on the notification)
    FirebaseMessaging.onBackgroundMessage(
      handleBackgroundMessage,
    );

    return super.initialize();
  }

  /// Disposes token and message subscriptions.
  @override
  Future<void> dispose() async {
    await _tokenSubscription?.cancel();
    await _messageSubscription?.cancel();

    await _tokenController.close();

    await _notificationController.close();

    return super.dispose();
  }

  /// Prompts the user for notification permissions.
  ///
  ///  - On iOS, a dialog is shown requesting the users permission.
  ///  - On macOS, a notification will appear asking to grant permission.
  ///  - On Web, a popup requesting the users permission is shown using the native browser API.
  ///
  /// Note that on iOS, if [provisional] is set to `true`, silent notification permissions will be
  /// automatically granted. When notifications are delivered to the device, the
  /// user will be presented with an option to disable notifications, keep receiving
  /// them silently or enable prominent notifications.
  Future<void> requestPermission({
    /// Request permission to display alerts. Defaults to `true`.
    ///
    /// iOS/macOS only.
    bool alert = true,

    /// Request permission for Siri to automatically read out notification messages over AirPods.
    /// Defaults to `false`.
    ///
    /// iOS only.
    bool announcement = false,

    /// Request permission to update the application badge. Defaults to `true`.
    ///
    /// iOS/macOS only.
    bool badge = true,

    /// Request permission to display notifications in a CarPlay environment.
    /// Defaults to `false`.
    ///
    /// iOS only.
    bool carPlay = false,

    /// Request permission for critical alerts. Defaults to `false`.
    ///
    /// Note; your application must explicitly state reasoning for enabling
    /// critical alerts during the App Store review process or your may be
    /// rejected.
    ///
    /// iOS only.
    bool criticalAlert = false,

    /// Request permission to provisionally create non-interrupting notifications.
    /// Defaults to `false`.
    ///
    /// iOS only.
    bool provisional = false,

    /// Request permission to play sounds. Defaults to `true`.
    ///
    /// iOS/macOS only.
    bool sound = true,
  }) =>
      _firebaseMessaging.requestPermission(
        alert: alert,
        announcement: announcement,
        badge: badge,
        carPlay: carPlay,
        criticalAlert: criticalAlert,
        provisional: provisional,
        sound: sound,
      );

  /// Keeps in app messaging from showing messages until `allowMessages()` is called.
  Future<void> deferInAppMessages() =>
      _firebaseInAppMessaging.setMessagesSuppressed(true);

  /// Allows in app messages to be shown until `deferMessages()` is called or app is restarted
  Future<void> allowInAppMessages() =>
      _firebaseInAppMessaging.setMessagesSuppressed(false);

  /// Triggers in app messaging event with the given `eventName`.
  Future<void> triggerInAppMessageEvent(String eventName) =>
      _firebaseInAppMessaging.triggerEvent(eventName);

  /// Handles refreshing and updating tokens to the database.
  @visibleForTesting
  Future<void> handleToken(String? token) async {
    if (token == null) return;

    _tokenController.add(NotificationToken(token));
  }

  /// Handles the push notification
  @visibleForTesting
  Future<void> handleNotification(
    RemoteMessage notification, {
    PushNotificationType type = PushNotificationType.foreground,
  }) async {
    final pushNotification = PushNotification(
      remoteAction: RemoteAction.fromJson(notification.data),
      type: type,
    );

    _notificationController.add(pushNotification);
  }

  /// Subscribes the currently logged in user to the given topic. Topics allow
  /// us to send push notifications to a specific group of users.
  Future<void> subscribeToTopic(String topic) =>
      _firebaseMessaging.subscribeToTopic(topic);

  /// Unsubscribes the currently logged in user from the given topic. Topics allow
  /// us to send push notifications to a specific group of users.
  Future<void> unsubscribeFromTopic(String topic) =>
      _firebaseMessaging.unsubscribeFromTopic(topic);
}

/// This function must be a top level function, see:
/// https://firebase.flutter.dev/docs/messaging/usage/#background-messages
Future<void> handleBackgroundMessage(RemoteMessage message) async {}
