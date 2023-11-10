// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockFirebaseInAppMessaging extends Mock
    implements FirebaseInAppMessaging {}

class MockNotificationSettings extends Mock implements NotificationSettings {}

class MockRemoteMessage extends Mock implements RemoteMessage {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FirebaseMessaging firebaseMessaging;
  late FirebaseInAppMessaging firebaseInAppMessaging;
  late NotificationRepository notificationRepository;
  late RemoteMessage remoteMessage;
  const notificationToken = 'notificationToken';

  setUp(
    () async {
      registerFallbackValue(
        <String, dynamic>{},
      );
      registerFallbackValue('');
      registerFallbackValue(User.empty);
      const options = FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      );
      final platformApp = FirebaseAppPlatform(defaultFirebaseAppName, options);
      final firebaseCore = MockFirebaseCore();

      when(() => firebaseCore.apps).thenReturn([platformApp]);
      when(firebaseCore.app).thenReturn(platformApp);
      when(
        () => firebaseCore.initializeApp(
          name: defaultFirebaseAppName,
          options: options,
        ),
      ).thenAnswer((_) async => platformApp);
      Firebase.delegatePackingProperty = firebaseCore;

      firebaseMessaging = MockFirebaseMessaging();
      firebaseInAppMessaging = MockFirebaseInAppMessaging();

      remoteMessage = MockRemoteMessage();

      notificationRepository = NotificationRepository.mockable(
        firebaseMessaging: firebaseMessaging,
        firebaseInAppMessaging: firebaseInAppMessaging,
      );
    },
  );
  group(
    'NotificationRepository',
    () {
      test(
        'creates FirebaseMessaging, FirebaseInAppMessaging, AuthenticationRepository, DatabaseRepository, RemoteActionRepository '
        'when not injected',
        () {
          expect(NotificationRepository.new, isNot(throwsException));
        },
      );

      group(
        'initialize',
        () {
          setUp(
            () {
              when(
                () => firebaseInAppMessaging.setAutomaticDataCollectionEnabled(
                  true,
                ),
              ).thenAnswer(
                (_) async {
                  return;
                },
              );
              when(() => firebaseMessaging.onTokenRefresh)
                  .thenAnswer((_) => const Stream.empty());
              when(() => firebaseMessaging.getToken())
                  .thenAnswer((_) async => null);
              when(() => firebaseMessaging.getInitialMessage())
                  .thenAnswer((_) async => null);
              when(() => firebaseInAppMessaging.setMessagesSuppressed(true))
                  .thenAnswer(
                (_) async {
                  return;
                },
              );
            },
          );

          test(
            'calls all the necessary methods '
            'when initialize is called',
            () async {
              await notificationRepository.initialize(isTestMode: true);

              verify(
                () => firebaseInAppMessaging
                    .setAutomaticDataCollectionEnabled(true),
              ).called(1);
              verify(() => firebaseMessaging.onTokenRefresh).called(1);
              verify(() => firebaseMessaging.getToken()).called(1);
              verify(() => firebaseMessaging.getInitialMessage()).called(1);
              verify(() => firebaseInAppMessaging.setMessagesSuppressed(true))
                  .called(1);
            },
          );

          test(
            'will not defer messages '
            'when deferInAppMessagesByDefault is false',
            () async {
              await notificationRepository.initialize(
                isTestMode: true,
                deferInAppMessagesByDefault: false,
              );

              verifyNever(
                () => firebaseInAppMessaging.setMessagesSuppressed(true),
              );
            },
          );

          test(
            'will not handle any remote messages '
            'when there is no initial remote messages',
            () async {
              unawaited(
                expectLater(
                  notificationRepository.notifications,
                  emitsInOrder(
                    [emitsDone],
                  ),
                ),
              );
              await notificationRepository.initialize(isTestMode: true);
              await notificationRepository.dispose();
            },
          );

          test(
            'handles token refresh '
            'when initial token is not null',
            () async {
              when(() => firebaseMessaging.getToken())
                  .thenAnswer((_) async => notificationToken);

              unawaited(
                expectLater(
                  notificationRepository.tokenChanges,
                  emitsInOrder([anything, emitsDone]),
                ),
              );

              await notificationRepository.initialize(isTestMode: true);
              await notificationRepository.dispose();
            },
          );

          test(
            'handles notification  '
            'when initial notification is not null',
            () async {
              const data = {
                'action': 'action',
                'data': 'data',
              };

              when(() => firebaseMessaging.getInitialMessage())
                  .thenAnswer((_) async => remoteMessage);
              when(() => remoteMessage.data).thenReturn(data);

              unawaited(
                expectLater(
                  notificationRepository.notifications,
                  emitsInOrder([anything]),
                ),
              );

              await notificationRepository.initialize(isTestMode: true);
            },
          );
        },
      );

      group(
        'FirebaseMessaging',
        () {
          group(
            'requestPermission',
            () {
              test(
                'calls requestPermission with correct parameters '
                'when parameters are given',
                () async {
                  // These values are reverses of the default values

                  when(
                    () => firebaseMessaging.requestPermission(
                      alert: false,
                      announcement: true,
                      badge: false,
                      carPlay: true,
                      criticalAlert: true,
                      provisional: true,
                      sound: false,
                    ),
                  ).thenAnswer((_) async => MockNotificationSettings());

                  await notificationRepository.requestPermission(
                    alert: false,
                    announcement: true,
                    badge: false,
                    carPlay: true,
                    criticalAlert: true,
                    provisional: true,
                    sound: false,
                  );

                  verify(
                    () => firebaseMessaging.requestPermission(
                      alert: false,
                      announcement: true,
                      badge: false,
                      carPlay: true,
                      criticalAlert: true,
                      provisional: true,
                      sound: false,
                    ),
                  ).called(1);
                },
              );

              test(
                'calls requestPermission with correct parameters '
                'when parameters are not given (default params)',
                () async {
                  // These values are reverses of the default values

                  when(
                    () => firebaseMessaging.requestPermission(),
                  ).thenAnswer((_) async => MockNotificationSettings());

                  await notificationRepository.requestPermission();

                  verify(
                    () => firebaseMessaging.requestPermission(),
                  ).called(1);
                },
              );
            },
          );

          group(
            'handleToken',
            () {
              test(
                'stops execution '
                'when given token is null',
                () async {
                  unawaited(
                    expectLater(
                      notificationRepository.tokenChanges,
                      emitsInOrder([emitsDone]),
                    ),
                  );
                  await notificationRepository.handleToken(null);
                  await notificationRepository.dispose();
                },
              );
            },
          );

          group(
            'handleNotification',
            () {
              test(
                'adds new notification to notifications stream '
                'when type is PushNotificationType.foreground',
                () async {
                  const data = {
                    'action': 'action',
                    'data': 'data',
                  };

                  unawaited(
                    expectLater(
                      notificationRepository.notifications,
                      emitsInOrder([anything, emitsDone]),
                    ),
                  );

                  when(() => remoteMessage.data).thenReturn(data);

                  // For clarification, we provide the redundant arguments
                  // ignore: avoid_redundant_argument_values
                  await notificationRepository.handleNotification(
                    remoteMessage,
                  );

                  await notificationRepository.dispose();
                },
              );
              test(
                'adds new notification to notifications stream '
                'when type is PushNotificationType.background',
                () async {
                  const data = {
                    'action': 'action',
                    'data': 'data',
                  };

                  unawaited(
                    expectLater(
                      notificationRepository.notifications,
                      emitsInOrder([anything, emitsDone]),
                    ),
                  );

                  when(() => remoteMessage.data).thenReturn(data);

                  await notificationRepository.handleNotification(
                    remoteMessage,
                    type: PushNotificationType.background,
                  );

                  await notificationRepository.dispose();
                },
              );

              test(
                'adds new notification to notifications stream '
                'when type is PushNotificationType.initial',
                () async {
                  const data = {
                    'action': 'action',
                    'data': 'data',
                  };

                  unawaited(
                    expectLater(
                      notificationRepository.notifications,
                      emitsInOrder([anything, emitsDone]),
                    ),
                  );

                  when(() => remoteMessage.data).thenReturn(data);

                  await notificationRepository.handleNotification(
                    remoteMessage,
                    type: PushNotificationType.initial,
                  );

                  await notificationRepository.dispose();
                },
              );
            },
          );

          group(
            'topics',
            () {
              test(
                'calls subscribeToTopic with correct parameter '
                'when subscribeToTopic is called',
                () async {
                  const topic = 'exampleTopic';
                  when(() => firebaseMessaging.subscribeToTopic(topic))
                      .thenAnswer(
                    (_) async {
                      return;
                    },
                  );
                  await notificationRepository.subscribeToTopic(topic);
                  verify(() => firebaseMessaging.subscribeToTopic(topic))
                      .called(1);
                },
              );

              test(
                'calls unsubscribeFromTopic with correct parameter '
                'when unsubscribeFromTopic is called',
                () async {
                  const topic = 'exampleTopic';
                  when(() => firebaseMessaging.unsubscribeFromTopic(topic))
                      .thenAnswer(
                    (_) async {
                      return;
                    },
                  );
                  await notificationRepository.unsubscribeFromTopic(topic);
                  verify(() => firebaseMessaging.unsubscribeFromTopic(topic))
                      .called(1);
                },
              );
            },
          );
        },
      );

      group(
        'FirebaseInAppMessaging',
        () {
          test(
            'calls setMessagesSupressed(true) '
            'when deferInAppMessages is called',
            () async {
              when(() => firebaseInAppMessaging.setMessagesSuppressed(true))
                  .thenAnswer(
                (_) async {
                  return;
                },
              );
              await notificationRepository.deferInAppMessages();
              verify(() => firebaseInAppMessaging.setMessagesSuppressed(true))
                  .called(1);
            },
          );
          test(
            'calls setMessagesSupressed(false) '
            'when allowInAppMessages is called',
            () async {
              when(() => firebaseInAppMessaging.setMessagesSuppressed(false))
                  .thenAnswer(
                (_) async {
                  return;
                },
              );
              await notificationRepository.allowInAppMessages();
              verify(() => firebaseInAppMessaging.setMessagesSuppressed(false))
                  .called(1);
            },
          );
          test(
            'calls triggerEvent with correct parameter '
            'when triggerInAppMessageEvent is called',
            () async {
              const event = 'exampleEvent';
              when(() => firebaseInAppMessaging.triggerEvent(event)).thenAnswer(
                (_) async {
                  return;
                },
              );
              await notificationRepository.triggerInAppMessageEvent(event);
              verify(() => firebaseInAppMessaging.triggerEvent(event))
                  .called(1);
            },
          );
        },
      );
    },
  );
}
