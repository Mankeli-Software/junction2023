import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';

/// {@template push_notification}
/// A push notification, which consists of a [remoteAction] and a [type].
/// {@endtemplate}
class PushNotification {
  /// {@macro push_notification}
  PushNotification({
    required this.remoteAction,
    required this.type,
  });

  /// The remote action to be performed.
  final RemoteAction remoteAction;

  /// The type of the notification.
  final PushNotificationType type;
}
