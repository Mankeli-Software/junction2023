// ignore_for_file: prefer-moving-to-variable
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
    final theme = context.theme;
    final router = context.router;

    return BlocConsumer<GameDetailsCubit, GameDetailsState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => s1.titleIsDown != s2.titleIsDown,
      builder: (context, state) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();

            return false;
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              context
                  .read<GameDetailsCubit>()
                  .setScrollOffset(scroll.metrics.pixels);

              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                      width: double.infinity,
                      padding: EdgeInsetsDirectional.only(
                        start: state.titleIsDown ? 20 : 50,
                        bottom: 13,
                        top: state.titleIsDown ? 60 : 0,
                      ),
                      decoration: state.titleIsDown
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  theme.backgroundColor.withOpacity(0.2),
                                  theme.backgroundColor.withOpacity(0.8),
                                  theme.backgroundColor,
                                  theme.backgroundColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            )
                          : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            game.title,
                            style: theme.headlineSmall.copyWith(
                              color: state.titleIsDown
                                  ? theme.primaryColor
                                  : theme.backgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (state.titleIsDown)
                            Text(
                              game.subtitle,
                              style: theme.titleSmall.copyWith(
                                  // color: state.titleIsDown ? theme.primaryColor : theme.backgroundColor,
                                  ),
                            ),
                        ],
                      ),
                    ),
                    background: Hero(
                      transitionOnUserGestures: true,
                      tag: game.id,
                      child: CachedNetworkImage(
                        alignment: Alignment(0, game.verticalAlignment),
                        fit: BoxFit.fitHeight,
                        imageUrl: game.imgageUrl,
                        errorWidget: (context, url, error) => const Center(
                          child: FaIcon(
                            FontAwesomeIcons.triangleExclamation,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ListTile(
                        title: Container(
                          color: theme.backgroundColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          height: 1200,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.router.push(
                                    HideAndSeekRoute(
                                      details: game,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    color: theme.primaryColor,
                                  ),
                                  child: Text(
                                    'Start Game',
                                    style: theme.titleMedium.copyWith(
                                      color: theme.onPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => router.push(
                                  JoinGameRoute(details: game),
                                ),
                                child: Text(
                                  'Join Game',
                                  style: theme.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Details',
                                  style: theme.titleLarge.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      'Sensors: ',
                                      style: theme.titleLarge,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.hand,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.haptic)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.microphone,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.microphone)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.locationArrow,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.location)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.groupArrowsRotate,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.gyroscope)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.compass,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.compass)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.gaugeHigh,
                                    color: game.sensorTypes
                                            .contains(SensorTypes.accelerometer)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(flex: 4),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      'Difficulty: ',
                                      style: theme.titleLarge,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.hippo,
                                    color: theme.primaryColor,
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.hippo,
                                    color: theme.primaryColor,
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.hippo,
                                    color: theme.primaryColor,
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.hippo,
                                    color: theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.hippo,
                                    color: theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  const Spacer(flex: 4),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      'Time: ',
                                      style: theme.titleLarge,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.clock,
                                    color: theme.primaryColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '~30 min',
                                    style: theme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Description',
                                  style: theme.titleLarge.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(game.decription),
                              // TODO(JTorkk): If time implement leadreboard or something fun
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
