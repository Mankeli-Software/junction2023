// ignore_for_file: type=lint

import 'package:analytic_repository/analytic_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:cloud_function_repository/cloud_function_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jmp/main/launch_helper.dart';
import 'package:jmp/resource/resource.dart';
import 'package:jmp/utility/utility.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:permission_repository/permission_repository.dart';
import 'package:provider/provider.dart';
import 'package:storage_repository/storage_repository.dart';

/// {@template test_helper}
/// A helper class to bootstrap the app for testing.
/// {@endtemplate
class TestHelper {
  static late AppRouter router;
  static late PermissionRepository permissionRepository;

  static late CacheRepository cacheRepository;

  static late CloudFunctionRepository cloudFunctionRepository;

  static late StorageRepository storageRepository;

  static late DatabaseRepository databaseRepository;

  static late AnalyticRepository analyticRepository;

  static late AuthenticationRepository authenticationRepository;

  static late NotificationRepository notificationRepository;

  static late DeepLinkRepository deepLinkRepository;

  /// {@macro test_helper}
  ///
  /// [setUp] sets up the mocked dependencies
  static void setUp() {
    router = MockAppRouter();
    permissionRepository = MockPermissionRepository();
    cacheRepository = MockCacheRepository();

    cloudFunctionRepository = MockCloudFunctionRepository();

    storageRepository = MockStorageRepository();

    databaseRepository = MockDatabaseRepository();

    analyticRepository = MockAnalyticRepository();

    authenticationRepository = MockAuthenticationRepository();

    notificationRepository = MockNotificationRepository();

    deepLinkRepository = MockDeepLinkRepository();

    final repos = [
      permissionRepository,
      cacheRepository,
      cloudFunctionRepository,
      storageRepository,
      databaseRepository,
      analyticRepository,
      authenticationRepository,
      notificationRepository,
      deepLinkRepository,
    ];

    for (final repo in repos) {
      when(() => repo.initialize()).thenAnswer((_) async {});
      when(() => repo.dispose()).thenAnswer((_) async {});
    }
  }

  /// {@macro test_helper}
  ///
  /// [bootstrap] bootstraps the app with mocked dependencies.
  static Widget bootstrap(Widget child) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: permissionRepository),
        RepositoryProvider.value(value: cacheRepository),
        RepositoryProvider.value(value: cloudFunctionRepository),
        RepositoryProvider.value(value: storageRepository),
        RepositoryProvider.value(value: databaseRepository),
        RepositoryProvider.value(value: analyticRepository),
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider.value(value: notificationRepository),
        RepositoryProvider.value(value: deepLinkRepository),
      ],
      child: Provider<Flavor>.value(
        value: Flavor.development,
        child: ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme()..initialize(),
          child: StackRouterScope(
            controller: router,
            stateHash: 0,
            child: MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
              ],
              home: Scaffold(
                body: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MockPermissionRepository extends Mock implements PermissionRepository {}

class MockAppRouter extends Mock implements AppRouter {}

class MockCacheRepository extends Mock implements CacheRepository {}

class MockCloudFunctionRepository extends Mock
    implements CloudFunctionRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockDatabaseRepository extends Mock implements DatabaseRepository {}

class MockAnalyticRepository extends Mock implements AnalyticRepository {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockNotificationRepository extends Mock
    implements NotificationRepository {}

class MockDeepLinkRepository extends Mock implements DeepLinkRepository {}
