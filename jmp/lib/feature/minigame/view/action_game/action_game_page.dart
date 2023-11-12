part of 'action_game.dart';

/// {@template action_game_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [ActionGameView] with a provider of type
/// [ActionGameCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class ActionGamePage extends StatelessWidget {
  /// {@macro action_game_page}
  const ActionGamePage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  /// The title of the minigame
  final String title;

  /// The description / instructions of the minigame
  final String description;

  /// The image of the minigame
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActionGameCubit>(
      create: (_) => ActionGameCubit()..initialize(),
      child: ActionGameView(
        title: title,
        description: description,
        imageUrl: imageUrl,
      ),
    );
  }
}
