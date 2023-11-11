part of 'game_details.dart';

/// {@template game_details_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [GameDetailsView] with a provider of type
/// [GameDetailsCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class GameDetailsPage extends StatelessWidget {
  /// {@macro game_details_page}
  const GameDetailsPage({super.key, required this.game});

  /// The game to display
  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
      ),
      body: BlocProvider<GameDetailsCubit>(
        create: (_) => GameDetailsCubit()..initialize(),
        child: GameDetailsView(game: game),
      ),
    );
  }
}
