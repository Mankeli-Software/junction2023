part of 'balance_game.dart';

/// {@template balance_game_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [BalanceGameView] with a provider of type
/// [BalanceGameCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class BalanceGamePage extends StatelessWidget {
  /// {@macro balance_game_page}
  const BalanceGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<BalanceGameCubit>(
        create: (_) => BalanceGameCubit()..initialize(),
        child: const BalanceGameView(),
      ),
    );
  }
}
