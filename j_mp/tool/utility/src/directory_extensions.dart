import 'dart:io';

import 'package:path/path.dart' as path;

/// {@template directory_extensions}
/// Extensions on [Directory] to make it easier to work with directories.
/// {@endtemplate}
extension DirectoryExtensions on Directory {
  /// {@macro directory_extensions}
  ///
  /// [subpackages] returns a list of all subdirectories that are
  /// dart or flutter packages (i.e. contain a `pubspec.yaml` file).
  List<Directory> get subpackages => listSync(recursive: true)
      .whereType<File>()
      .where((f) => path.basename(f.path) == 'pubspec.yaml')
      .map((f) => f.parent)
      .where((d) => !_subpackagesToIgnore.any((r) => r.hasMatch(d.path)))
      .toList();

  /// {@macro directory_extensions}
  ///
  /// [subpackagesWithBuildRunner] returns a list of all subdirectories that are
  /// dart or flutter packages (i.e. contain a `pubspec.yaml` file) and
  /// contain the `build_runner` dependency.
  List<Directory> get subpackagesWithBuildRunner => subpackages
      .where(
        (d) => File('${d.path}/pubspec.yaml')
            .readAsStringSync()
            .contains('build_runner'),
      )
      .toList();
}

final _subpackagesToIgnore = <RegExp>[
  RegExp('.*tool/.*'),
  RegExp('.*dart_tool/.*'),
  RegExp('.*/ios/.*'),
  RegExp('.*/android/.*'),
];
