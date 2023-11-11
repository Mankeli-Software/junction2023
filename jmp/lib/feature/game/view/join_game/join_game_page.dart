part of 'join_game.dart';

/// {@template join_game_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [JoinGameView] with a provider of type
/// [JoinGameCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class JoinGamePage extends StatelessWidget {
  /// {@macro join_game_page}
  const JoinGamePage({
    super.key,
    required this.details,
  });

  ///
  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Game'),
      ),
      body: BlocProvider<JoinGameCubit>(
        create: (_) => JoinGameCubit()..initialize(),
        child: JoinGameView(details: details),
      ),
    );
  }
}
