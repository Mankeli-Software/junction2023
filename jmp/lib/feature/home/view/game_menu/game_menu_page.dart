part of 'game_menu.dart';

/// {@template game_menu_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [GameMenuView] with a provider of type
/// [GameMenuCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class GameMenuPage extends StatelessWidget {
  /// {@macro game_menu_page}
  const GameMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GameMenuCubit>(
        create: (_) => GameMenuCubit()..initialize(),
        child: const GameMenuView(),
      ),
    );
  }
}
