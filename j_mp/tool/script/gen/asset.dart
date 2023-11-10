import 'package:cmd_plus/cmd_plus.dart';

const flavors = [
  'development',
  'staging',
  'production',
];

void main() async {
  final cmdPlus = CmdPlus();

  final getPackages = cmdPlus.logger.progress('Getting packages');

  await cmdPlus.run(
    'flutter',
    ['pub', 'get'],
    mode: const CmdPlusMode.detached(),
  );

  getPackages.complete();

  for (final flavor in flavors) {
    final appIcon = cmdPlus.logger.progress(
      'Generating app icons for $flavor -flavor',
    );

    await cmdPlus.run(
      'flutter',
      [
        'pub',
        'run',
        'icons_launcher:create',
        '--flavor=$flavor',
        '--path=flavor_$flavor.yaml',
      ],
      mode: const CmdPlusMode.detached(),
    );

    appIcon.complete();

    final splashScreen = cmdPlus.logger.progress(
      'Generating splash screen for $flavor -flavor',
    );

    await cmdPlus.run(
      'flutter',
      [
        'pub',
        'run',
        'flutter_native_splash:create',
        '--flavor=$flavor',
        '--path=flavor_$flavor.yaml',
      ],
      mode: const CmdPlusMode.detached(),
    );

    splashScreen.complete();
  }

  await cmdPlus.close();
}
