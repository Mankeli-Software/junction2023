part of 'game_details.dart';

/// {@template game_details_view}
/// The view for [GameDetailsCubit].
/// {@endtemplate}
class GameDetailsView extends StatelessWidget {
  /// {@macro game_details_view}
  const GameDetailsView({super.key, required this.game});

  /// The game to display
  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsCubit, GameDetailsState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return SizedBox(
          // height: 300,
          width: double.infinity,
          child: Hero(
            transitionOnUserGestures: true,
            tag: game.id,
            child: CachedNetworkImage(
              alignment: Alignment(0, game.verticalAlignment),
              fit: BoxFit.fitWidth,
              imageUrl: game.imgageUrl,
              errorWidget: (context, url, error) => const Center(
                child: FaIcon(
                  FontAwesomeIcons.triangleExclamation,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
