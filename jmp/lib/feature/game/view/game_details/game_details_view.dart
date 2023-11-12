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
              context.read<GameDetailsCubit>().setScrollOffset(scroll.metrics.pixels);

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
                              color: state.titleIsDown ? theme.primaryColor : theme.backgroundColor,
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
                            horizontal: 20,
                            vertical: 30,
                          ),
                          height: 1200,
                          child: Column(
                            children: [
                              TextButton(
                                //
                                // ignore: prefer-extracting-callbacks
                                onPressed: () {
                                  if (game.id == '9dc64b0f-5160-4f02-9e4a-20de220a6335') {
                                    context.router.push(
                                      HideAndSeekRoute(
                                        details: game,
                                        isSeeker: true,
                                      ),
                                    );
                                  }
                                  if (game.id == '5f9fa253-7d28-4b6b-91d6-c3c04e3a974b') {
                                    context.router.push(const MapDemoRoute());
                                    // pushWidget(
                                    //   // Material(
                                    //   //   color: const Color(0xFF2E3132),
                                    //   //   child: Scaffold(
                                    //   //     body: Stack(
                                    //   //       alignment: Alignment.center,
                                    //   //       children: [
                                    //   //         CachedNetworkImage(
                                    //   //           fit: BoxFit.fill,
                                    //   //           imageUrl:
                                    //   //               'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/Screenshot%202021-03-08%20at%2020.23%201.png?alt=media&token=32ba15e9-3e1a-442f-90d0-42dafaaa66eb',
                                    //   //         ),
                                    //   //         Padding(
                                    //   //           padding: const EdgeInsets.only(left: 20, right: 10),
                                    //   //           child: Column(
                                    //   //             children: [
                                    //   //               const SizedBox(height: 50),
                                    //   //               Row(
                                    //   //                 children: [
                                    //   //                   TextButton(
                                    //   //                     onPressed: () => context.router.pop(),
                                    //   //                     child: Container(
                                    //   //                       padding: const EdgeInsets.all(20),
                                    //   //                       decoration: BoxDecoration(
                                    //   //                         // borderRadius: BorderRadius.circular(30),
                                    //   //                         color: theme.backgroundColor,
                                    //   //                         shape: BoxShape.circle,
                                    //   //                       ),
                                    //   //                       child: FaIcon(
                                    //   //                         FontAwesomeIcons.chevronLeft,
                                    //   //                         color: theme.primaryColor,
                                    //   //                       ),
                                    //   //                     ),
                                    //   //                   ),
                                    //   //                   const SizedBox(width: 20),
                                    //   //                   Text(
                                    //   //                     'Choose area for\n your adventure',
                                    //   //                     style: theme.titleLarge
                                    //   //                         .copyWith(color: theme.backgroundColor, fontWeight: FontWeight.bold),
                                    //   //                   ),
                                    //   //                 ],
                                    //   //               ),
                                    //   //               Padding(
                                    //   //                 padding: const EdgeInsets.only(left: 40),
                                    //   //                 child: Text(
                                    //   //                   'It will be generated around you.',
                                    //   //                   style: theme.titleMedium.copyWith(
                                    //   //                     color: theme.backgroundColor,
                                    //   //                     // fontWeight: FontWeight.bold,
                                    //   //                   ),
                                    //   //                 ),
                                    //   //               ),
                                    //   //               const Spacer(flex: 2),
                                    //   //               Container(
                                    //   //                 width: 300,
                                    //   //                 height: 300,
                                    //   //                 decoration: BoxDecoration(
                                    //   //                   border: Border.fromBorderSide(BorderSide(color: theme.backgroundColor, width: 2)),
                                    //   //                   color: theme.primaryColor.withOpacity(0.3),
                                    //   //                   shape: BoxShape.circle,
                                    //   //                 ),
                                    //   //                 child: Center(
                                    //   //                   child: FaIcon(
                                    //   //                     FontAwesomeIcons.locationPin,
                                    //   //                     color: theme.onPrimaryColor,
                                    //   //                   ),
                                    //   //                 ),
                                    //   //               ),
                                    //   //               const Spacer(flex: 2),
                                    //   //               Row(
                                    //   //                 children: [
                                    //   //                   const Spacer(flex: 5),
                                    //   //                   Column(
                                    //   //                     children: [
                                    //   //                       Text(
                                    //   //                         'Diameter',
                                    //   //                         style: theme.titleMedium.copyWith(
                                    //   //                           color: theme.backgroundColor,
                                    //   //                           // fontWeight: FontWeight.bold,
                                    //   //                         ),
                                    //   //                       ),
                                    //   //                       Text(
                                    //   //                         '3,4 km',
                                    //   //                         style: theme.titleMedium.copyWith(
                                    //   //                           color: theme.backgroundColor,
                                    //   //                           // fontWeight: FontWeight.bold,
                                    //   //                         ),
                                    //   //                       ),
                                    //   //                     ],
                                    //   //                   ),
                                    //   //                   const Spacer(flex: 4),
                                    //   //                   FaIcon(
                                    //   //                     FontAwesomeIcons.locationCrosshairs,
                                    //   //                     color: theme.backgroundColor,
                                    //   //                   ),
                                    //   //                   const Spacer(),
                                    //   //                 ],
                                    //   //               ),
                                    //   //               Row(
                                    //   //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   //                 children: [
                                    //   //                   Text(
                                    //   //                     '1 km',
                                    //   //                     style: theme.titleMedium.copyWith(
                                    //   //                       color: theme.backgroundColor,
                                    //   //                       // fontWeight: FontWeight.bold,
                                    //   //                     ),
                                    //   //                   ),
                                    //   //                   Stack(
                                    //   //                     alignment: Alignment.center,
                                    //   //                     children: [
                                    //   //                       Container(
                                    //   //                         height: 2,
                                    //   //                         width: 250,
                                    //   //                         // width: double.infinity,
                                    //   //                         color: theme.backgroundColor,
                                    //   //                       ),
                                    //   //                       Container(
                                    //   //                         height: 20,
                                    //   //                         width: 20,
                                    //   //                         decoration: BoxDecoration(
                                    //   //                           shape: BoxShape.circle,
                                    //   //                           color: theme.backgroundColor,
                                    //   //                         ),
                                    //   //                         // width: double.infinity,
                                    //   //                       ),
                                    //   //                     ],
                                    //   //                   ),
                                    //   //                   Text(
                                    //   //                     '5 km',
                                    //   //                     style: theme.titleMedium.copyWith(
                                    //   //                       color: theme.backgroundColor,
                                    //   //                       // fontWeight: FontWeight.bold,
                                    //   //                     ),
                                    //   //                   ),
                                    //   //                 ],
                                    //   //               ),
                                    //   //               const Spacer(),
                                    //   //               TextButton(
                                    //   //                 onPressed: () {},
                                    //   //                 child: Container(
                                    //   //                   padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                    //   //                   decoration: BoxDecoration(
                                    //   //                     color: theme.backgroundColor,
                                    //   //                     borderRadius: BorderRadius.circular(
                                    //   //                       30,
                                    //   //                     ),
                                    //   //                   ),
                                    //   //                   child: const Text('Start adventure now'),
                                    //   //                 ),
                                    //   //               ),
                                    //   //               const Spacer(),
                                    //   //             ],
                                    //   //           ),
                                    //   //         ),
                                    //   //       ],
                                    //   //     ),
                                    //   //   ),
                                    //   //   // Center(
                                    //   //   //   child: Column(
                                    //   //   //     mainAxisAlignment: MainAxisAlignment.center,
                                    //   //   //     children: [
                                    //   //   //       Padding(
                                    //   //   //         padding: const EdgeInsets.all(50),
                                    //   //   //         child: QrImageView(
                                    //   //   //           data: 'jackhunction',
                                    //   //   //         ),
                                    //   //   //       ),
                                    //   //   //       TextButton(
                                    //   //   //         onPressed: () {
                                    //   //   //           context.router.pop();
                                    //   //   //         },
                                    //   //   //         child: Text(
                                    //   //   //           'Close',
                                    //   //   //           style: theme.titleMedium.copyWith(
                                    //   //   //             color: theme.onBackgroundColor,
                                    //   //   //             fontWeight: FontWeight.w600,
                                    //   //   //           ),
                                    //   //   //         ),
                                    //   //   //       ),
                                    //   //   //     ],
                                    //   //   //   ),
                                    //   //   // ),
                                    //   // ),
                                    // );
                                  }
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
                                    color: game.sensorTypes.contains(SensorTypes.haptic)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.microphone,
                                    color: game.sensorTypes.contains(SensorTypes.microphone)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.locationArrow,
                                    color: game.sensorTypes.contains(SensorTypes.location)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.groupArrowsRotate,
                                    color: game.sensorTypes.contains(SensorTypes.gyroscope)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.compass,
                                    color: game.sensorTypes.contains(SensorTypes.compass)
                                        ? theme.primaryColor
                                        : theme.primaryColor.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  FaIcon(
                                    FontAwesomeIcons.gaugeHigh,
                                    color: game.sensorTypes.contains(SensorTypes.accelerometer)
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
