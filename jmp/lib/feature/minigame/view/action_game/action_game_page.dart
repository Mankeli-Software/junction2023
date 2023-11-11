part of 'action_game.dart';

/// {@template action_game_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [ActionGameView] with a provider of type
/// [ActionGameCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class ActionGamePage extends StatelessWidget {
  /// {@macro action_game_page}
  const ActionGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ActionGameCubit>(
        create: (_) => ActionGameCubit()..initialize(),
        child: const ActionGameView(),
      ),
    );
  }
}
