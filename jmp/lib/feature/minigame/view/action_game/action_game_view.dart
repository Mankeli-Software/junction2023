part of 'action_game.dart';

/// {@template action_game_view}
/// The view for [ActionGameCubit].
/// {@endtemplate}
class ActionGameView extends StatelessWidget {
  /// {@macro action_game_view}
  const ActionGameView({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  /// The title of the minigame
  final String title;

  /// The description / instructions of the minigame
  final String description;

  /// The image of the minigame
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return BlocConsumer<ActionGameCubit, ActionGameState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        if (state.timeLeft.isNegative) {
          context.router.pop(false);
        }

        if (state.status == ActionGameStatus.success) {
          context.router.pop(true);
        }
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return state.timeLeft.isNegative ||
                state.status == ActionGameStatus.success;
          },
          child: Scaffold(
            body: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.s,
                children: [
                  Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: min(
                            constraints.maxHeight,
                            constraints.maxWidth,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      title,
                      style: theme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(description, style: theme.bodyLarge),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      'Time left: ${max(0, state.timeLeft.inSeconds)} s',
                      style: theme.labelLarge.copyWith(
                        color: theme.errorColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: theme.containerColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: state.currentProgress,
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: state.requiredProgress - state.currentProgress,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Swiftly move your phone around to fill the progress bar!',
                      style: theme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
