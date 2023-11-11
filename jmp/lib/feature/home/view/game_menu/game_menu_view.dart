part of 'game_menu.dart';

/// {@template game_menu_view}
/// The view for [GameMenuCubit].
/// {@endtemplate}
class GameMenuView extends StatelessWidget {
  /// {@macro game_menu_view}
  const GameMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameMenuCubit, GameMenuState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
