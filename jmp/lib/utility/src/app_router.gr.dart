// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          isTest: args.isTest,
        ),
      );
    },
    GameMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameMenuPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingPage(),
      );
    },
    AppRoute.name: (routeData) {
      final args =
          routeData.argsAs<AppRouteArgs>(orElse: () => const AppRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppPage(
          key: args.key,
          isTest: args.isTest,
        ),
      );
    },
    GameDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameDetailsPage(),
      );
    },
    HideAndSeekRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HideAndSeekPage(),
      );
    },
    ActionGameRoute.name: (routeData) {
      final args = routeData.argsAs<ActionGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActionGamePage(
          key: args.key,
          title: args.title,
          description: args.description,
          imageUrl: args.imageUrl,
        ),
      );
    },
    BalanceGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BalanceGamePage(),
      );
    },
    PermissionRoute.name: (routeData) {
      final args = routeData.argsAs<PermissionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PermissionPage(
          key: args.key,
          permissions: args.permissions,
          onResult: args.onResult,
        ),
      );
    },
    AuthenticatedRouteWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticatedRouteWrapperPage(),
      );
    },
    AuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    bool isTest = false,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            isTest: isTest,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.isTest = false,
  });

  final Key? key;

  final bool isTest;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, isTest: $isTest}';
  }
}

/// generated route for
/// [GameMenuPage]
class GameMenuRoute extends PageRouteInfo<void> {
  const GameMenuRoute({List<PageRouteInfo>? children})
      : super(
          GameMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuPage]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppPage]
class AppRoute extends PageRouteInfo<AppRouteArgs> {
  AppRoute({
    Key? key,
    bool isTest = false,
    List<PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(
            key: key,
            isTest: isTest,
          ),
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<AppRouteArgs> page = PageInfo<AppRouteArgs>(name);
}

class AppRouteArgs {
  const AppRouteArgs({
    this.key,
    this.isTest = false,
  });

  final Key? key;

  final bool isTest;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key, isTest: $isTest}';
  }
}

/// generated route for
/// [GameDetailsPage]
class GameDetailsRoute extends PageRouteInfo<void> {
  const GameDetailsRoute({List<PageRouteInfo>? children})
      : super(
          GameDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HideAndSeekPage]
class HideAndSeekRoute extends PageRouteInfo<void> {
  const HideAndSeekRoute({List<PageRouteInfo>? children})
      : super(
          HideAndSeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'HideAndSeekRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ActionGamePage]
class ActionGameRoute extends PageRouteInfo<ActionGameRouteArgs> {
  ActionGameRoute({
    Key? key,
    required String title,
    required String description,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
          ActionGameRoute.name,
          args: ActionGameRouteArgs(
            key: key,
            title: title,
            description: description,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'ActionGameRoute';

  static const PageInfo<ActionGameRouteArgs> page =
      PageInfo<ActionGameRouteArgs>(name);
}

class ActionGameRouteArgs {
  const ActionGameRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final Key? key;

  final String title;

  final String description;

  final String imageUrl;

  @override
  String toString() {
    return 'ActionGameRouteArgs{key: $key, title: $title, description: $description, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [BalanceGamePage]
class BalanceGameRoute extends PageRouteInfo<void> {
  const BalanceGameRoute({List<PageRouteInfo>? children})
      : super(
          BalanceGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'BalanceGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PermissionPage]
class PermissionRoute extends PageRouteInfo<PermissionRouteArgs> {
  PermissionRoute({
    Key? key,
    required List<Permission> permissions,
    required void Function({bool success}) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          PermissionRoute.name,
          args: PermissionRouteArgs(
            key: key,
            permissions: permissions,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'PermissionRoute';

  static const PageInfo<PermissionRouteArgs> page =
      PageInfo<PermissionRouteArgs>(name);
}

class PermissionRouteArgs {
  const PermissionRouteArgs({
    this.key,
    required this.permissions,
    required this.onResult,
  });

  final Key? key;

  final List<Permission> permissions;

  final void Function({bool success}) onResult;

  @override
  String toString() {
    return 'PermissionRouteArgs{key: $key, permissions: $permissions, onResult: $onResult}';
  }
}

/// generated route for
/// [AuthenticatedRouteWrapperPage]
class AuthenticatedRouteWrapperRoute extends PageRouteInfo<void> {
  const AuthenticatedRouteWrapperRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouteWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
