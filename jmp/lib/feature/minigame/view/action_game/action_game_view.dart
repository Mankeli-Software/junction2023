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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Minigame',
                style: theme.titleLarge.copyWith(
                  color: theme.onPrimaryColor,
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: theme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: theme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Image.network(
                              imageUrl,
                              height: min(
                                constraints.maxHeight,
                                constraints.maxWidth,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Time left: ${max(0, state.timeLeft.inSeconds)} s',
                        style: theme.labelSmall.copyWith(
                          color: theme.errorColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
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
                            flex:
                                state.requiredProgress - state.currentProgress,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Swiftly move your phone around to fill the progress bar!',
                        style: theme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
