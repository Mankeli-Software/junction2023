/// {@template push_notification_type}
/// The state of the app when the push notification was received.
/// [PushNotificationType.foreground] means the app was open and in the foreground.
/// [PushNotificationType.background] means the app was not in use, but in the background.
/// [PushNotificationType.initial] means the app was closed and the notification was tapped to open the app.
/// {@endtemplate}
enum PushNotificationType {
  /// {@macro push_notification_type}
  foreground,

  /// {@macro push_notification_type}
  background,

  /// {@macro push_notification_type}
  initial,
}
