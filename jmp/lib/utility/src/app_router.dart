import 'package:analytic_repository/analytic_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:cloud_function_repository/cloud_function_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:jmp/feature/feature.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_repository/permission_repository.dart';
import 'package:storage_repository/storage_repository.dart';

part 'app_router.gr.dart';

/// {@template app_router}
/// The router of the app.
/// {@endtemplate}
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  /// {@macro app_router}
  AppRouter({
    required this.databaseRepository,
    required this.analyticRepository,
    required this.permissionRepository,
    required this.cacheRepository,
    required this.cloudFunctionRepository,
    required this.storageRepository,
    required this.authenticationRepository,
    required this.notificationRepository,
    required this.deepLinkRepository,
  }) : super();

  /// {@macro app_router}
  final DatabaseRepository databaseRepository;

  /// {@macro app_router}
  final AnalyticRepository analyticRepository;

  /// {@macro app_router}
  final PermissionRepository permissionRepository;

  /// {@macro app_router}
  final CacheRepository cacheRepository;

  /// {@macro app_router}
  final CloudFunctionRepository cloudFunctionRepository;

  /// {@macro app_router}
  final StorageRepository storageRepository;

  /// {@macro app_router}
  final AuthenticationRepository authenticationRepository;

  /// {@macro app_router}
  final NotificationRepository notificationRepository;

  /// {@macro app_router}
  final DeepLinkRepository deepLinkRepository;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  /// The current context of the navigator key
  BuildContext get context => navigatorKey.currentContext!;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: AuthenticatedRouteWrapper.page,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  children: [
                    AutoRoute(
                      page: GameMenuRoute.page,
                    ),
                    AutoRoute(
                      page: ProfileRoute.page,
                    ),
                    AutoRoute(
                      page: MenuRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  page: HideAndSeekRoute.page,
                ),
                AutoRoute(
                  page: ActionGameRoute.page,
                ),
                AutoRoute(
                  page: BalanceGameRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: AuthenticationRoute.page,
            ),
            AutoRoute(
              page: PermissionRoute.page,
            ),
            AutoRoute(
              page: LoadingRoute.page,
            ),
          ],
        ),
      ];
}

/// {@template mankeli_route_observer}
/// The route observer of the app.
/// {@endtemplate}
class AppRouterObserver extends AutoRouterObserver {
  /// {@macro mankeli_route_observer}
  AppRouterObserver({
    required this.analyticRepository,
  });

  /// The analytics repository for logging route changes
  final AnalyticRepository analyticRepository;

  void _logRouteChange(String? routeName) {
    if (routeName == null) return;

    analyticRepository.logRouteChange(routeName);

    AppLogger.i('Route changed to $routeName ');
  }

  /// Called when the current route has been pushed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _logRouteChange(route.settings.name);

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _logRouteChange(route.settings.name);

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _logRouteChange(newRoute?.settings.name);

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _logRouteChange(route.settings.name);

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) =>
      _logRouteChange(route.name);

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) =>
      _logRouteChange(route.name);
}

/// {@template permisson_guard}
/// A guard for routes that require a specific permission
/// {@endtemplate}
/// This is an example guard to use for routes that need location permission.
class PermissionGuard extends AutoRouteGuard {
  /// {@macro permission_guard}
  PermissionGuard({
    required this.permissions,
    required this.permissionRepository,
  });

  /// {@macro permission_guard}
  final PermissionRepository permissionRepository;

  /// {@macro permission_guard}
  final List<Permission> permissions;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (permissions.every(permissionRepository.hasPermission)) {
      // if has permission, we continue
      resolver.next();
    } else {
      // we redirect the user to our permission screen
      await router.push(
        PermissionRoute(
          permissions: permissions,
          onResult: ({success = false}) {
            resolver.next(success);
            router.removeLast();
          },
        ),
      );
    }
  }
}
