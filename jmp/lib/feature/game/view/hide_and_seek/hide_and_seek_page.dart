part of 'hide_and_seek.dart';

/// {@template hide_and_seek_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [HideAndSeekView] with a provider of type
/// [HideAndSeekCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class HideAndSeekPage extends StatelessWidget {
  /// {@macro hide_and_seek_page}
  const HideAndSeekPage({
    super.key,
    required this.details,
  });

  /// The details of the game
  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HideAndSeekCubit>(
        create: (_) => HideAndSeekCubit()..initialize(),
        child: HideAndSeekView(
          details: details,
        ),
      ),
    );
  }
}
