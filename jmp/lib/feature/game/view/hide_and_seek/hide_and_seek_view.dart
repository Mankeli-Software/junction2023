part of 'hide_and_seek.dart';

/// {@template hide_and_seek_view}
/// The view for [HideAndSeekCubit].
/// {@endtemplate}
class HideAndSeekView extends StatelessWidget {
  /// {@macro hide_and_seek_view}
  const HideAndSeekView({super.key});

  /// Shows minigame
  void showMiniGame(BuildContext context) {
    final routes = <PageRouteInfo<dynamic>>[
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
            'Engage in an exhilarating challenge where you must leap energetically while gripping your phone. Aim to jump as high and as frequently as possible. Failing to complete the challenge on time will briefly reveal your whereabouts to the seeker.',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/jump.png?alt=media&token=965180f6-c878-4e64-b5dc-4de2dd13e22a',
      ),
    ];

    final index = Random().nextInt(routes.length);

    context.router.push(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final user = context.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HapticHide',
        ),
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.play,
            ),
            onPressed: () => showMiniGame(context),
          ),
        ],
      ),
      body: BlocConsumer<HideAndSeekCubit, HideAndSeekState>(
        listenWhen: (s1, s2) => true,
        listener: (context, state) {
          return;
        },
        buildWhen: (s1, s2) => s1.state != s2.state,
        builder: (context, state) {
          final status = state.state?.status;
          final isCreator = state.state?.creatorId == user.id!;

          if (status == GameStatus.lobby) {
            return Column(
              children: [
                Text(
                  'Waiting for the game creator to start the game!',
                ),
                if (isCreator)
                  ElevatedButton(
                    onPressed: () {
                      // TODO: start the game
                    },
                    child: Text(
                      'Start the game',
                    ),
                  ),
              ],
            );
          } else if (status == GameStatus.playing) {
            final isFound = state.state?.playerData
                    .where((pd) => pd.playerId == user.id)
                    .firstOrNull
                    ?.found ??
                false;

            final isSeeker = state.state?.isSeeker(user) ?? false;

            return Column(
              children: [
                if (isFound)
                  Text(
                    'You have been found, wait for the next round!',
                  )
                else if (state.status == HideAndSeekStatus.counting)
                  Text('The seeker is counting, hide!')
                else if (state.status == HideAndSeekStatus.searching)
                  Text('The seeker is searching, stay hidden!'),
                if (isSeeker)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final maxWidth = constraints.maxWidth * 0.8;

                      return BlocBuilder<HideAndSeekCubit, HideAndSeekState>(
                        buildWhen: (s1, s2) =>
                            s1.compassEvent != s2.compassEvent ||
                            s1.distanceToClosest != s2.distanceToClosest ||
                            s1.ownLocation != s2.ownLocation,
                        builder: (context, state) {
                          final direction = state.compassEvent?.heading;
                          final dist = state.distanceToClosest;

                          final hintBearing = () {
                            final latlng = state.showLocations.firstOrNull;
                            if (latlng == null || state.ownLocation == null) {
                              return null;
                            }

                            return Geolocator.bearingBetween(
                              latlng.latitude,
                              latlng.longitude,
                              state.ownLocation!.latitude,
                              state.ownLocation!.longitude,
                            );
                          }.call();

                          return Transform.rotate(
                            angle: ((direction ?? 0) + (hintBearing ?? 0)) *
                                (pi / 180) *
                                -1,
                            child: SizedBox(
                              width: maxWidth,
                              height: maxWidth,
                              child: Stack(
                                children: [
                                  if (hintBearing != null)
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: FaIcon(
                                        FontAwesomeIcons.chevronUp,
                                        color: theme.onBackgroundColor,
                                      ),
                                    ),
                                  Container(
                                    width: maxWidth * 0.8,
                                    height: maxWidth * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(
                                        dist > 500 ? 1.0 : 0.3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: maxWidth * 0.7,
                                    height: maxWidth * 0.7,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(
                                        dist > 300 ? 1.0 : 0.3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: maxWidth * 0.6,
                                    height: maxWidth * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(
                                        dist > 100 ? 1.0 : 0.3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: maxWidth * 0.5,
                                    height: maxWidth * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen.withOpacity(
                                        dist > 50 ? 1.0 : 0.3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: maxWidth * 0.4,
                                    height: maxWidth * 0.4,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
              ],
            );
          }

          return Column(
            children: [
              Text(
                'Game finished, all of the players have been found',
              ),
            ],
          );
        },
      ),
    );
  }
}
