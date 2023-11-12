part of 'balance_game.dart';

/// {@template balance_game_view}
/// The view for [BalanceGameCubit].
/// {@endtemplate}
class BalanceGameView extends StatelessWidget {
  /// {@macro balance_game_view}
  const BalanceGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BalanceGameCubit, BalanceGameState>(
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
