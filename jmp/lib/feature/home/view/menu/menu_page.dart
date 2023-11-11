part of 'menu.dart';

/// {@template menu_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [MenuView] with a provider of type
/// [MenuCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class MenuPage extends StatelessWidget {
  /// {@macro menu_page}
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MenuCubit>(
        create: (_) => MenuCubit()..initialize(),
        child: const MenuView(),
      ),
    );
  }
}
