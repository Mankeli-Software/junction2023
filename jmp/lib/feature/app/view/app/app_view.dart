part of 'app.dart';

/// {@template app_view}
/// A view for rendering the apps menu and loading screen
/// {@endtemplate}
class AppView extends StatelessWidget {
  /// {@macro app_view}
  const AppView({
    super.key,
    @visibleForTesting this.isTest = false,
  });

  /// Testing nested routes from auto_route has proven to be quite hard,
  /// so in tests will render a Placeholder instead of AutoRouter
  @visibleForTesting
  final bool isTest;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (isTest) return const Placeholder();

        return AutoRouter.declarative(
          routes: (_) => [
            if (state.startupLogicStatus == StartupLogicStatus.running ||
                state.currentUser.isEmpty)
              const LoadingRoute()
            else if (state.currentUser.isUnAuthenticated)
              const AuthenticationRoute()
            else
              HomeRoute(),
          ],
        );
      },
    );
  }
}
