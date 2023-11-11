part of 'action_game.dart';

/// {@template action_game_view}
/// The view for [ActionGameCubit].
/// {@endtemplate}
class ActionGameView extends StatelessWidget {
  /// {@macro action_game_view}
  const ActionGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActionGameCubit, ActionGameState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return const Placeholder();
      },
    );
  }
}
