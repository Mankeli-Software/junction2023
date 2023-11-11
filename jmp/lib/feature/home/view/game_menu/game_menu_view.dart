part of 'game_menu.dart';

/// {@template game_menu_view}
/// The view for [GameMenuCubit].
/// {@endtemplate}
class GameMenuView extends StatelessWidget {
  /// {@macro game_menu_view}
  const GameMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final games = <GameDetails>[
      const GameDetails(
        id: '9dc64b0f-5160-4f02-9e4a-20de220a6335',
        imgageUrl:
            'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/DALL%C2%B7E%202023-11-10%2021.58.29%20-%20A%20graphic%20style%20banner%20for%20a%20hide%20and%20seek%20game.%20The%20background%20is%20a%20simple%2C%20solid%20orange%20color.%20There%20are%20silhouettes%20of%20characters%2C%20representing%20a%20v.png?alt=media&token=26c89239-76c5-446a-8d4a-9c1e30457119',
        title: 'HapticHide',
        subtitle: "Hide'n'Seek with modern twist",
        decription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis ipsum leo, id consectetur metus sollicitudin non. Donec a rutrum nunc. Vestibulum semper gravida diam nec malesuada. Proin suscipit venenatis nisl vitae efficitur. Cras at eleifend felis. In hac habitasse platea dictumst. Etiam aliquam rhoncus mauris at egestas. Praesent facilisis vulputate arcu eu dignissim. Suspendisse nulla felis, rutrum sit amet tempus sed, sagittis id metus.',
        verticalAlignment: 0.69,
        sensorTypes: [
          SensorTypes.haptic,
          SensorTypes.gyroscope,
          SensorTypes.accelerometer,
          SensorTypes.location,
          SensorTypes.compass,
        ],
      ),
      const GameDetails(
        id: '5f9fa253-7d28-4b6b-91d6-c3c04e3a974b',
        imgageUrl:
            'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/DALL%C2%B7E%202023-11-11%2016.18.59%20-%20A%20very%20simple%2C%20cartoonish%20banner%20for%20the%20game%2C%20focusing%20on%20the%20theme%20of%20adventure%20and%20physical%20activity%2C%20without%20any%20text%20or%20name.%20Central%20to%20the%20imag.png?alt=media&token=3a9729c5-a8ea-4fa4-8fb4-96ac5576de83',
        title: 'ExploreX',
        decription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis ipsum leo, id consectetur metus sollicitudin non. Donec a rutrum nunc. Vestibulum semper gravida diam nec malesuada. Proin suscipit venenatis nisl vitae efficitur. Cras at eleifend felis. In hac habitasse platea dictumst. Etiam aliquam rhoncus mauris at egestas. Praesent facilisis vulputate arcu eu dignissim. Suspendisse nulla felis, rutrum sit amet tempus sed, sagittis id metus.',
        subtitle: 'Uncover Adventures, Stay Active!',
        verticalAlignment: 0.3,
        sensorTypes: [
          SensorTypes.haptic,
          SensorTypes.gyroscope,
          SensorTypes.accelerometer,
          SensorTypes.location,
          SensorTypes.microphone,
          SensorTypes.compass,
        ],
      ),
      const GameDetails(
        id: '20e50b64-d9a5-4281-a020-43e2f567bd05',
        imgageUrl:
            "https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/DALL%C2%B7E%202023-11-11%2016.35.52%20-%20Create%20a%20playful%2C%20cartoonish%20banner%20for%20a%20game%20titled%20'Banner%20Blitz'%2C%20with%20a%20focus%20on%20adventure%20and%20strategy%2C%20and%20no%20text.%20The%20central%20element%20is%20a%20co.png?alt=media&token=56f77dbf-9e82-4b12-adeb-bbb206eb71fa",
        title: 'Banner Blitz',
        decription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis ipsum leo, id consectetur metus sollicitudin non. Donec a rutrum nunc. Vestibulum semper gravida diam nec malesuada. Proin suscipit venenatis nisl vitae efficitur. Cras at eleifend felis. In hac habitasse platea dictumst. Etiam aliquam rhoncus mauris at egestas. Praesent facilisis vulputate arcu eu dignissim. Suspendisse nulla felis, rutrum sit amet tempus sed, sagittis id metus.',
        subtitle: 'Seize the Banner, Conquer the Map!',
        verticalAlignment: -0.7,
        sensorTypes: [
          SensorTypes.haptic,
          SensorTypes.haptic,
          SensorTypes.gyroscope,
          SensorTypes.accelerometer,
          SensorTypes.location,
          SensorTypes.compass,
        ],
      ),
      const GameDetails(
        id: 'f5315a4f-13d8-4b81-91c8-3abb78ce6290',
        imgageUrl:
            'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/DALL%C2%B7E%202023-11-10%2021.58.29%20-%20A%20graphic%20style%20banner%20for%20a%20hide%20and%20seek%20game.%20The%20background%20is%20a%20simple%2C%20solid%20orange%20color.%20There%20are%20silhouettes%20of%20characters%2C%20representing%20a%20v.png?alt=media&token=26c89239-76c5-446a-8d4a-9c1e30457119',
        title: 'name',
        decription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis ipsum leo, id consectetur metus sollicitudin non. Donec a rutrum nunc. Vestibulum semper gravida diam nec malesuada. Proin suscipit venenatis nisl vitae efficitur. Cras at eleifend felis. In hac habitasse platea dictumst. Etiam aliquam rhoncus mauris at egestas. Praesent facilisis vulputate arcu eu dignissim. Suspendisse nulla felis, rutrum sit amet tempus sed, sagittis id metus.',
        subtitle: 'Hunt or Be Hunted',
      ),
      const GameDetails(
        id: '6175ad0f-0277-4f40-85cd-906cce04924d',
        imgageUrl:
            'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/DALL%C2%B7E%202023-11-10%2021.58.29%20-%20A%20graphic%20style%20banner%20for%20a%20hide%20and%20seek%20game.%20The%20background%20is%20a%20simple%2C%20solid%20orange%20color.%20There%20are%20silhouettes%20of%20characters%2C%20representing%20a%20v.png?alt=media&token=26c89239-76c5-446a-8d4a-9c1e30457119',
        title: 'Test',
        decription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis ipsum leo, id consectetur metus sollicitudin non. Donec a rutrum nunc. Vestibulum semper gravida diam nec malesuada. Proin suscipit venenatis nisl vitae efficitur. Cras at eleifend felis. In hac habitasse platea dictumst. Etiam aliquam rhoncus mauris at egestas. Praesent facilisis vulputate arcu eu dignissim. Suspendisse nulla felis, rutrum sit amet tempus sed, sagittis id metus.',
        subtitle: 'subtitle todo',
      ),
    ];
    final theme = context.theme;
    final router = context.router;

    return BlocConsumer<GameMenuCubit, GameMenuState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activites',
                    style: theme.headlineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();

                  return false;
                },
                child: ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];

                    return GestureDetector(
                      onTap: () => router.push(GameDetailsRoute(game: game)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: theme.containerColor,
                          boxShadow: [
                            BoxShadow(
                              color: theme.textColor.withOpacity(0.4),
                              offset: const Offset(0, 1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: SizedBox(
                                height: 180,
                                width: double.infinity,
                                child: Hero(
                                  transitionOnUserGestures: true,
                                  tag: game.id,
                                  child: CachedNetworkImage(
                                    alignment:
                                        Alignment(0, game.verticalAlignment),
                                    fit: BoxFit.fitWidth,
                                    imageUrl: game.imgageUrl,
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.triangleExclamation,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        game.title,
                                        style: theme.titleLarge.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        game.subtitle,
                                        style: theme.titleMedium.copyWith(),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 16),
                                  Text(
                                    'Play',
                                    style: theme.titleLarge.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                  const Spacer(flex: 2),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: theme.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
