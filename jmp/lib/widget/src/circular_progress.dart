import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jmp/extension/extension.dart';

/// {@template circular_progress}
/// This reusable widget defines how every single circular progress indicator
/// in the app should look. For customizing the appearance, see https://pub.dev/packages/flutter_spinkit
/// {@endtemplate}
class CircularProgress extends StatelessWidget {
  /// {@macro circular_progress}
  const CircularProgress({super.key, this.color});

  /// Color of the progress indicator. Defaults to `DynamicTheme.instance.primaryColor`
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 60,
        maxHeight: 60,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SpinKitCircle(
          color: color ?? context.theme.primaryColor,
        ),
      ),
    );
  }
}
