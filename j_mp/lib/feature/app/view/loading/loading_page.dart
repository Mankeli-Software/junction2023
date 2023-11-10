part of 'loading.dart';

/// {@template loading_view}
/// It's time for the loading screen! This one uses assets/splash_screen.png as the background,
/// so it looks the same as native splash screen (if everything is set up correctly, that is).
/// {@endtemplate}
@RoutePage()
class LoadingPage extends StatelessWidget {
  /// {@macro loading_view}
  const LoadingPage({
    super.key,
  });

  /// {@macro loading_view}
  @visibleForTesting
  static const kSplashScreenKey = Key('LoadingView_splashScreen');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AssetsExtension.splashScreen(context.flavor).image(
            key: kSplashScreenKey,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
