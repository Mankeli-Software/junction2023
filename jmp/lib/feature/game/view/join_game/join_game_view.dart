part of 'join_game.dart';

/// {@template join_game_view}
/// The view for [JoinGameCubit].
/// {@endtemplate}
class JoinGameView extends StatelessWidget {
  /// {@macro join_game_view}
  const JoinGameView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return BlocConsumer<JoinGameCubit, JoinGameState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return switch (state.readerStatus) {
          ReaderStaus.scanning => Column(
              children: [
                const Spacer(),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: MobileScanner(
                            controller: MobileScannerController(
                              detectionSpeed: DetectionSpeed.noDuplicates,
                              // facing: CameraFacing.,
                              // torchEnabled: false,
                              formats: [BarcodeFormat.qrCode],
                            ),
                            // TODO(JTorkk): Add haptic feedback to onDetect
                            onDetect: (capture) {
                              final value = capture.barcodes.first.rawValue;
                              if (value != null) {
                                context.read<JoinGameCubit>().onCode();
                              }

                              // final barcodes = capture.barcodes;
                              // final Uint8List? image = capture.image;
                              // for (final barcode in barcodes) {
                              //   debugPrint('Barcode found! ${barcode.rawValue}');
                              // }
                            },
                          ),
                        ),
                      ),
                      CustomPaint(
                        size: const Size.square(300),
                        painter: CustomScannerOverlayPainter(
                          borderColor: theme.primaryColor,
                          borderWidth: 15,
                          cornerRadius: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: LinearProgressIndicator(
                    minHeight: 20,
                    backgroundColor: theme.primaryColor.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
                const Text('Reading'),
                const Spacer(),
              ],
            ),
          ReaderStaus.codeReadSuccess => Center(
              child: Column(
                children: [
                  const Spacer(),
                  FaIcon(
                    FontAwesomeIcons.thumbsUp,
                    size: 200,
                    color: theme.successColor,
                  ),
                  const Spacer(),
                  Text(
                    'Game Found!',
                    style: theme.displaySmall.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.router.push(const HideAndSeekRoute());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Text(
                        'Join Game',
                        style: theme.bodyLarge.copyWith(
                          color: theme.onPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.read<JoinGameCubit>().initialize(),
                    child: Text(
                      'back',
                      style: theme.bodyLarge.copyWith(
                        color: theme.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ReaderStaus.error => Column(
              children: [
                const FaIcon(FontAwesomeIcons.triangleExclamation),
                const Text('Error happened'),
                TextButton(
                  onPressed: () => context.read<JoinGameCubit>().initialize(),
                  child: const Text('Try again'),
                ),
              ],
            ),
        };
      },
    );
  }
}

/// {@template CustomScannerOverlayPainter}
/// Renders corners for the scanner overlay.
/// {@endtemplate}
class CustomScannerOverlayPainter extends CustomPainter {
  /// {@macro CustomScannerOverlayPainter}
  CustomScannerOverlayPainter({
    required this.borderColor,
    required this.borderWidth,
    this.cornerRadius = 20,
  });

  /// The color of the border
  final Color borderColor;

  /// The width of the border
  final double borderWidth;

  ///   The radius of the corners
  final double cornerRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    // Top left corner
    canvas
      ..drawArc(
        Rect.fromLTWH(0, 0, cornerRadius * 2, cornerRadius * 2),
        pi,
        pi / 2,
        false,
        paint,
      )

      // Top right corner
      ..drawArc(
        Rect.fromLTWH(size.width - cornerRadius * 2, 0, cornerRadius * 2,
            cornerRadius * 2),
        -pi / 2,
        pi / 2,
        false,
        paint,
      )

      // Bottom left corner

      ..drawArc(
        Rect.fromLTWH(0, size.height - cornerRadius * 2, cornerRadius * 2,
            cornerRadius * 2),
        pi / 2,
        pi / 2,
        false,
        paint,
      )

      // Bottom right corner
      ..drawArc(
        Rect.fromLTWH(size.width - cornerRadius * 2,
            size.height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2),
        0,
        pi / 2,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
