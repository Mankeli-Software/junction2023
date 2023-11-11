part of 'game_details.dart';

/// {@template game_details_view}
/// The view for [GameDetailsCubit].
/// {@endtemplate}
class GameDetailsView extends StatelessWidget {
  /// {@macro game_details_view}
  const GameDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsCubit, GameDetailsState>(
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
