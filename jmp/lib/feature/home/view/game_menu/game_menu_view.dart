part of 'game_menu.dart';

/// {@template game_menu_view}
/// The view for [GameMenuCubit].
/// {@endtemplate}
class GameMenuView extends StatelessWidget {
  /// {@macro game_menu_view}
  const GameMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameMenuCubit, GameMenuState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return Center(
          child: TextButton(
            onPressed: () {
              final routes = [
                ActionGameRoute(
                  title: 'Duel of Blades!',
                  description:
                      'Engage in an epic duel with a swashbuckling pirate! Use your phone as your blade, swiping and slashing with precision to emerge victorious. Fail to triumph in the allotted time, and your seeker gets a fleeting glimpse of your whereabouts.',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/pirate.png?alt=media&token=43fe5f0e-b1bf-4085-8a39-d8e5f071d9ed',
                ),
                ActionGameRoute(
                  title: 'Shadowbox Showdown!',
                  description:
                      "Enter the virtual ring for an exhilarating shadow boxing challenge! Hold your phone and throw punches in the air to defeat your virtual rival. But be quick! If you don't triumph in time, your location gets revealed to your seeker for a brief moment!",
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/boxing.png?alt=media&token=ba10d16e-3cac-42a2-a880-5331eb825f6c',
                ),
                ActionGameRoute(
                  title: 'Leap & Evade!',
                  description:
                      "Engage in an exhilarating challenge where you must leap energetically while gripping your phone. Aim to jump as high and as frequently as possible. Failing to complete the challenge on time will briefly reveal your whereabouts to the seeker.",
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/jump.png?alt=media&token=965180f6-c878-4e64-b5dc-4de2dd13e22a',
                ),
              ];
              context.router.push(
                routes.first,
              );
            },
            child: const Text('Jump to minigame'),
          ),
        );
      },
    );
  }
}
