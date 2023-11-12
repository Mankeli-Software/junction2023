// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: prefer-extracting-callbacks

import 'dart:async';

import 'package:analytic_repository/analytic_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:cloud_function_repository/cloud_function_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jmp/extension/extension.dart';
import 'package:jmp/resource/resource.dart';
import 'package:jmp/utility/utility.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:permission_repository/permission_repository.dart';
import 'package:provider/provider.dart';
import 'package:storage_repository/storage_repository.dart';

/// {@template launch_helper}
/// [LaunchHelper] is a helper class that is used to bootstrap the app.
/// {@endtemplate}
class LaunchHelper {
  /// {@macro launch_helper}
  ///
  /// [bootstrap] is called from different flavors main.dart files. This method
  /// is responsible for initializing the app by adding providers for
  /// repositories, routers, themes and more.
  static Future<void> bootstrap({
    required Flavor flavor,
    required FirebaseOptions firebaseOptions,
  }) async {
    /// Catches uncaught errors and logs them to crashlytics.
    await runZonedGuarded(
      () async {
        /// Keeps the app from automatically closing the native splash screen.
        /// Native splash screen can be closed by calling widgetsBinding.allowFirstFrame().
        /// It is closed in lib/features/app/cubit/app_cubit.dart
        final binding = WidgetsFlutterBinding.ensureInitialized()
          ..deferFirstFrame();

        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        await SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [
            SystemUiOverlay.top,
          ],
        );

        await Firebase.initializeApp(
          options: firebaseOptions,
        );

        // await FirebaseRemoteConfig.instance.setConfigSettings(
        //   RemoteConfigSettings(
        //     fetchTimeout: const Duration(minutes: 1),
        //     minimumFetchInterval: const Duration(minutes: 30),
        //   ),
        // );
        // await FirebaseRemoteConfig.instance.fetchAndActivate();

        final databaseRepository = DatabaseRepository();

        final analyticRepository = AnalyticRepository();

        final authenticationRepository = AuthenticationRepository();

        final notificationRepository = NotificationRepository();

        final deepLinkRepository = DeepLinkRepository();

        final cacheRepository = CacheRepository();
        final permissionRepository = PermissionRepository();

        final cloudFunctionRepository = CloudFunctionRepository();

        final storageRepository = StorageRepository();

        final router = AppRouter(
          databaseRepository: databaseRepository,
          analyticRepository: analyticRepository,
          permissionRepository: permissionRepository,
          cacheRepository: cacheRepository,
          cloudFunctionRepository: cloudFunctionRepository,
          storageRepository: storageRepository,
          authenticationRepository: authenticationRepository,
          notificationRepository: notificationRepository,
          deepLinkRepository: deepLinkRepository,
        );

        AppLogger.instance.crashlytic = (message, [error, stackTrace]) {
          FirebaseCrashlytics.instance.recordError(
            error,
            stackTrace,
            fatal: true,
            reason: message,
          );
        };

        AppLogger.instance.analytic = (message, [_, __]) {
          analyticRepository.logEvent(message);
        };

        await AssetsExtension.splashScreen(flavor).cache();

        binding.addPostFrameCallback((_) {
          binding.allowFirstFrame();
        });
        runApp(
          _Bootstrap(
            flavor: flavor,
            router: router,
            databaseRepository: databaseRepository,
            analyticsRepository: analyticRepository,
            permissionRepository: permissionRepository,
            cacheRepository: cacheRepository,
            cloudFunctionRepository: cloudFunctionRepository,
            storageRepository: storageRepository,
            authenticationRepository: authenticationRepository,
            notificationRepository: notificationRepository,
            deepLinkRepository: deepLinkRepository,
          ),
        );
      },
      (error, stack) {
        AppLogger.c(
          'Uncaught error',
          error,
          stack,
        );

        AppLogger.e('Uncaught error', error, stack);
      },
    );
  }
}

class _Bootstrap extends StatelessWidget {
  const _Bootstrap({
    required this.flavor,
    required this.router,
    required this.databaseRepository,
    required this.analyticsRepository,
    required this.permissionRepository,
    required this.cacheRepository,
    required this.cloudFunctionRepository,
    required this.storageRepository,
    required this.authenticationRepository,
    required this.notificationRepository,
    required this.deepLinkRepository,
  });

  final Flavor flavor;
  final AppRouter router;

  final DatabaseRepository databaseRepository;

  final AnalyticRepository analyticsRepository;

  final PermissionRepository permissionRepository;
  final CacheRepository cacheRepository;

  final CloudFunctionRepository cloudFunctionRepository;

  final StorageRepository storageRepository;

  final AuthenticationRepository authenticationRepository;

  final NotificationRepository notificationRepository;

  final DeepLinkRepository deepLinkRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: databaseRepository),
        RepositoryProvider.value(value: analyticsRepository),
        RepositoryProvider.value(value: permissionRepository),
        RepositoryProvider.value(value: cacheRepository),
        RepositoryProvider.value(value: cloudFunctionRepository),
        RepositoryProvider.value(value: storageRepository),
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider.value(value: notificationRepository),
        RepositoryProvider.value(value: deepLinkRepository),
      ],
      child: Provider<Flavor>(
        create: (_) => flavor,
        child: ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme()..initialize(),
          child: Consumer<AppTheme>(
            builder: (context, theme, child) {
              return Center(
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''),
                  ],
                  theme: AppThemeLight().themeData,
                  darkTheme: AppThemeDark().themeData,
                  themeMode: theme.dynamicTheme.brightness == Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  routerDelegate: AutoRouterDelegate(
                    router,
                    navigatorObservers: () => [
                      AppRouterObserver(
                        analyticRepository: context.read<AnalyticRepository>(),
                      ),
                    ],
                  ),
                  routeInformationParser: router.defaultRouteParser(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// {@template flavor}
/// This enum represents the different flavors of the app.
/// {@endtemplate}
enum Flavor {
  /// {@macro flavor}
  ///
  /// [development] is the default flavor, used whilst developing the app.
  development,

  /// {@macro flavor}
  ///
  /// [staging] is used for testing the app before releasing it to production.
  /// People outside the dev team (clients, testers, etc.) usually use
  /// versions of the app that are built with the [staging] flavor.
  staging,

  /// {@macro flavor}
  ///
  /// [production] is the flavor that is used when the app is released to the
  /// general public.
  production,
}
