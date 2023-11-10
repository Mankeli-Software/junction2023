import 'dart:io';

import 'package:cmd_plus/cmd_plus.dart';

import '../../utility/utility.dart';

void main() async {
  final cmdPlus = CmdPlus();

  final progress = cmdPlus.logger.progress('Generating code');
  for (final dir in Directory.current.subpackagesWithBuildRunner) {
    await cmdPlus.run(
      'flutter',
      [
        'pub',
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs',
      ],
      workingDirectory: dir.path,
    );
  }
  progress.complete();
  await cmdPlus.close();
}
