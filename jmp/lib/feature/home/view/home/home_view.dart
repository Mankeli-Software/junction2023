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

  static const _pages = [
    MenuRoute(),
    GameMenuRoute(),
    ProfileRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final selectedColor = theme.primaryColor;
    final unselectedColor = theme.onBackgroundColor.withOpacity(0.9);

    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        if (isTest) return const Placeholder();

        return Scaffold(
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            boxShadow: [
              BoxShadow(
                color: theme.textColor.withOpacity(0.2),
                blurRadius: 7,
                offset: const Offset(0, 4),
              ),
            ],
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            backgroundColor: theme.backgroundColor,
            dotIndicatorColor: Colors.transparent,
            enablePaddingAnimation: false,
            currentIndex: _pages.indexOf(state.currentRoute),
            onTap: (index) {
              context.read<HomeCubit>().setRoute(_pages[index]);
            },
            items: [
              DotNavigationBarItem(
                icon: const FaIcon(
                  FontAwesomeIcons.bars,
                ),
              ),
              DotNavigationBarItem(
                icon: const FaIcon(
                  FontAwesomeIcons.gamepad,
                ),
              ),
              DotNavigationBarItem(
                icon: const FaIcon(
                  FontAwesomeIcons.user,
                ),
              ),
            ],
          ),
          body: AutoRouter.declarative(
            routes: (handler) => [
              state.currentRoute,
            ],
          ),
        );
      },
    );
  }
}
