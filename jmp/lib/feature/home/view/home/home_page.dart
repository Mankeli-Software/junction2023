part of 'home.dart';

/// {@template home_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [HomeView] with a provider of type
/// [HomeCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({
    super.key,
    @visibleForTesting this.isTest = false,
  });

  /// Testing nested routes from auto_route has proven to be quite hard,
  /// so in tests will render a Placeholder instead of AutoRouter
  @visibleForTesting
  final bool isTest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit()..initialize(),
      child: HomeView(isTest: isTest),
    );
  }
}
