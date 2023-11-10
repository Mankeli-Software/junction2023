import 'package:bloc_test/bloc_test.dart';
import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/feature/app/cubit/app/app.dart';
import 'package:j_mp/main/launch_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppCubit appCubit;

  setUp(
    () {
      TestHelper.setUp();

      appCubit = AppCubit(
        flavor: Flavor.development,
        router: TestHelper.router,

        permissionRepository: TestHelper.permissionRepository,
        ////// 
        deepLinkRepository: TestHelper.deepLinkRepository,
        ////// 
        databaseRepository: TestHelper.databaseRepository,
        ////// 
        authenticationRepository: TestHelper.authenticationRepository,
        ////// 
        ////// 
        analyticRepository: TestHelper.analyticRepository,
        ////// 
        ////// 
        notificationRepository: TestHelper.notificationRepository,
        ////// 

        cacheRepository: TestHelper.cacheRepository,
        ////// 
        cloudFunctionRepository: TestHelper.cloudFunctionRepository,
        ////// 

        ////// 
        storageRepository: TestHelper.storageRepository,
        ////// 
      );

      ////// 
      when(() => TestHelper.authenticationRepository.authChanges).thenAnswer(
        (_) => const Stream<User>.empty(),
      );
      ////// 

      ////// 
      when(() => TestHelper.deepLinkRepository.deepLinks).thenAnswer(
        (_) => const Stream<DeepLink>.empty(),
      );
      ////// 

      ////// 
      when(TestHelper.analyticRepository.logAppOpen).thenAnswer(
        (_) {},
      );

      when(TestHelper.analyticRepository.logStartupLogicComplete).thenAnswer(
        (_) {},
      );
      ////// 

      ////// 

      when(() => TestHelper.notificationRepository.notifications).thenAnswer(
        (_) => const Stream<PushNotification>.empty(),
      );
      when(() => TestHelper.notificationRepository.tokenChanges).thenAnswer(
        (_) => const Stream<NotificationToken>.empty(),
      );
      when(
        TestHelper.notificationRepository.allowInAppMessages,
      ).thenAnswer(
        (_) async {},
      );

      when(
        TestHelper.notificationRepository.requestPermission,
      ).thenAnswer(
        (_) async {},
      );
      ////// 
      when(
        TestHelper.databaseRepository.hasPromptedNotificationPermissions,
      ).thenAnswer((_) => false);

      when(
        TestHelper.databaseRepository.setNotificationPermissionsPrompted,
      ).thenAnswer(
        (_) async {},
      );
    },
  );

  group(
    'initialize',
    () {
      blocTest<AppCubit, AppState>(
        'calls all the necessary methods '
        'always',
        build: () => appCubit,
        act: (cubit) => cubit.initialize(),
        verify: (_) {
          ////// 
          verify(TestHelper.analyticRepository.logAppOpen).called(1);
          verify(TestHelper.analyticRepository.logStartupLogicComplete)
              .called(1);
          ////// 
          for (final r in appCubit.repositories) {
            verify(r.initialize).called(1);
          }
          ////// 
          verify(
            TestHelper.notificationRepository.allowInAppMessages,
          ).called(1);

          ////// 
        },
      );
    },
  );

  group(
    'setLifecycleState',
    () {
      blocTest<AppCubit, AppState>(
        'updates the lifecycle state '
        'when called ',
        build: () => appCubit,
        act: (cubit) {
          cubit
            ..setLifecycleState(AppLifecycleState.inactive)
            ..setLifecycleState(AppLifecycleState.detached)
            ..setLifecycleState(AppLifecycleState.resumed)
            ..setLifecycleState(AppLifecycleState.paused);
        },
        expect: () => [
          const AppState(lifecycleState: AppLifecycleState.inactive),
          const AppState(),
          const AppState(lifecycleState: AppLifecycleState.resumed),
          const AppState(lifecycleState: AppLifecycleState.paused),
        ],
      );
    },
  );

  ////// 
  group(
    'handlePushNotificationPermission',
    () {
      blocTest<AppCubit, AppState>(
        'does nothing '
        'when the user has already been prompted',
        setUp: () {
          when(
            () => TestHelper.databaseRepository
                .hasPromptedNotificationPermissions(),
          ).thenAnswer((_) => true);
        },
        build: () => appCubit,
        act: (cubit) async => appCubit.handlePushNotificationPermission(),
        verify: (_) {
          verifyNever(
            TestHelper.notificationRepository.requestPermission,
          );
          verifyNever(
            () => TestHelper.databaseRepository
                .setNotificationPermissionsPrompted(),
          );
        },
      );

      blocTest<AppCubit, AppState>(
        'requests permission '
        'when the user has not been prompted',
        setUp: () {
          when(
            () => TestHelper.databaseRepository
                .hasPromptedNotificationPermissions(),
          ).thenAnswer((_) => false);
        },
        build: () => appCubit,
        act: (cubit) async => cubit.handlePushNotificationPermission(),
        verify: (_) {
          verify(
            TestHelper.notificationRepository.requestPermission,
          ).called(1);
          verify(
            () => TestHelper.databaseRepository
                .setNotificationPermissionsPrompted(),
          ).called(1);
        },
      );
    },
  );

////// 
  group(
    'close',
    () {
      blocTest<AppCubit, AppState>(
        'calls all the necessary methods '
        'always',
        build: () => appCubit,
        act: (cubit) => cubit.close(),
        verify: (_) {
          ////// 
          verify(TestHelper.notificationRepository.dispose).called(2);
          ////// 

          ////// 
          verify(TestHelper.deepLinkRepository.dispose).called(2);
          ////// 

          verify(
            () => TestHelper.databaseRepository.dispose(),
          ).called(2);
        },
      );
    },
  );
}
