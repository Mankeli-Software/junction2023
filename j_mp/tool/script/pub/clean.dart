import 'dart:io';

import 'package:cmd_plus/cmd_plus.dart';

import '../../utility/utility.dart';

void main() async {
  final cmdPlus = CmdPlus();
  final progress = cmdPlus.logger.progress('Cleaning packages');
  for (final dir in Directory.current.subpackages) {
    await cmdPlus.run(
      'flutter',
      ['clean'],
      workingDirectory: dir.path,
      mode: const CmdPlusMode.detached(),
    );
  }

  progress.complete();
  await cmdPlus.close();
}
