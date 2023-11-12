part of 'hide_and_seek.dart';

/// {@template hide_and_seek_view}
/// The view for [HideAndSeekCubit].
/// {@endtemplate}
class HideAndSeekView extends StatelessWidget {
  /// {@macro hide_and_seek_view}
  const HideAndSeekView({
    super.key,
    required this.details,
    required this.isSeeker,
  });

  /// The game details
  final GameDetails details;

  /// Whether to display seeker UI or hider UI
  final bool isSeeker;

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

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'HapticHide',
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const FaIcon(
      //         FontAwesomeIcons.play,
      //       ),
      //       onPressed: () => showMiniGame(context),
      //     ),
      //   ],
      // ),
      body: BlocConsumer<HideAndSeekCubit, HideAndSeekState>(
        listenWhen: (s1, s2) => true,
        listener: (context, state) {
          return;
        },
        buildWhen: (s1, s2) =>
            s1.countingDuration != s2.countingDuration ||
            s1.status != s2.status,
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: details.id,
                      child: CachedNetworkImage(
                        alignment: Alignment(0, details.verticalAlignment),
                        fit: BoxFit.fitHeight,
                        imageUrl: details.imgageUrl,
                        errorWidget: (context, url, error) => const Center(
                          child: FaIcon(
                            FontAwesomeIcons.triangleExclamation,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Text(
                        details.title,
                        style: theme.headlineMedium.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.status == HideAndSeekStatus.lobby) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Players in lobby',
                          style: theme.headlineSmall,
                        ),
                        const Spacer(),
                        Text(
                          'Show',
                          style: theme.titleLarge.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.qrcode,
                            color: theme.primaryColor,
                          ),
                          onPressed: () {
                            context.router.pushWidget(
                              Material(
                                color: theme.backgroundColor,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(50),
                                        child: QrImageView(
                                          data: 'jackhunction',
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                        child: Text(
                                          'Close',
                                          style: theme.titleMedium.copyWith(
                                            color: theme.onBackgroundColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const _SinglePlayer(
                    name: 'Jack Hunction',
                    order: 1,
                  ),
                  const _SinglePlayer(
                    name: 'Pena',
                    order: 2,
                  ),
                  const _SinglePlayer(
                    name: 'Matti',
                    order: 3,
                  ),
                  const Spacer(),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.read<HideAndSeekCubit>().startGame();
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
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        'Cancel game',
                        style: theme.titleMedium.copyWith(
                          color: theme.onBackgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
                if (state.status == HideAndSeekStatus.counting) ...[
                  const Spacer(),
                  Center(
                    child: Text(
                      isSeeker ? 'Time to let others hide!' : 'Time to hide!',
                      style: theme.headlineMedium,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Center(
                    child: Text(
                      isSeeker
                          ? 'You can start searching in'
                          : 'The seeker will start searching in',
                      style: theme.titleLarge,
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      context
                          .read<HideAndSeekCubit>()
                          .setStatus(HideAndSeekStatus.searching);
                    },
                    child: Center(
                      child: Text(
                        '${max(0, state.countingDuration.inSeconds)}',
                        style: theme.displayLarge,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'seconds',
                      style: theme.titleLarge,
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
                if (state.status == HideAndSeekStatus.searching &&
                    isSeeker) ...[
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final maxWidth = constraints.maxWidth;

                      return Center(
                        child: BlocBuilder<HideAndSeekCubit, HideAndSeekState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onLongPress: () {
                                context.read<HideAndSeekCubit>().setStatus(
                                      HideAndSeekStatus.finished,
                                    );
                              },
                              child: Transform.rotate(
                                angle: (state.compassEvent?.heading ?? 0) *
                                    (pi / 180) *
                                    -1,
                                child: SizedBox(
                                  width: maxWidth * 0.8,
                                  height: maxWidth * 0.8,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Align(
                                        alignment: Alignment.topCenter,
                                        child: FaIcon(
                                          FontAwesomeIcons.chevronUp,
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.6,
                                        height: maxWidth * 0.6,
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.25),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.45,
                                        height: maxWidth * 0.45,
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.orange.withOpacity(0.25),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.3,
                                        height: maxWidth * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: maxWidth * 0.15,
                                        height: maxWidth * 0.15,
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      'Indicates distance to the closest player',
                      style: theme.titleLarge,
                    ),
                  ),
                ],
                if (state.status == HideAndSeekStatus.searching &&
                    !isSeeker) ...[
                  const Spacer(),
                  GestureDetector(
                    onLongPress: () {
                      context
                          .read<HideAndSeekCubit>()
                          .setStatus(HideAndSeekStatus.finished);
                    },
                    child: Center(
                      child: Text(
                        'The seeker is searching',
                        style: theme.headlineSmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onLongPress: () {
                      context.router.push(
                        ActionGameRoute(
                          title: 'Duel of Blades!',
                          description:
                              'Engage in an epic duel with a swashbuckling pirate! Use your phone as your blade, swiping and slashing with precision to emerge victorious. Fail to triumph in the allotted time, and your seeker gets a fleeting glimpse of your whereabouts.',
                          imageUrl:
                              'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/pirate.png?alt=media&token=43fe5f0e-b1bf-4085-8a39-d8e5f071d9ed',
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Keep a low profile and try not to get caught! Meanwhile be prepared to play some minigames.',
                        style: theme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
                if (state.status == HideAndSeekStatus.finished) ...[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Game over',
                        style: theme.headlineMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      FaIcon(
                        FontAwesomeIcons.trophy,
                        color: theme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Winner:',
                      style: theme.headlineSmall,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Jack Hunction',
                      style: theme.titleLarge,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.router.pop();
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
                          'End game',
                          style: theme.titleMedium.copyWith(
                            color: theme.onPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SinglePlayer extends StatelessWidget {
  const _SinglePlayer({
    required this.name,
    required this.order,
  });

  final String name;

  final int order;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      children: [
        const SizedBox(width: 30),
        Text(
          '$order. ',
          style: theme.headlineMedium,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: theme.containerColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            children: [
              Text(
                name,
                style: theme.titleLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
