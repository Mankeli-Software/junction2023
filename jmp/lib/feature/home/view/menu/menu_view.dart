part of 'menu.dart';

/// {@template menu_view}
/// The view for [MenuCubit].
/// {@endtemplate}
class MenuView extends StatelessWidget {
  /// {@macro menu_view}
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
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
