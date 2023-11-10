part of 'home.dart';

/// {@template home_view}
/// The view for [HomeCubit].
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({
    super.key,
    @visibleForTesting this.isTest = false,
  });

  /// Testing nested routes from auto_route has proven to be quite hard,
  /// so in tests will render a Placeholder instead of AutoRouter
  @visibleForTesting
  final bool isTest;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        if (isTest) return const Placeholder();

        return const AutoRouter();
      },
    );
  }
}
