import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmp/main/launch_helper.dart';
import 'package:jmp/resource/resource.dart';

/// {@template assets_extension}
/// Extension methods for [Assets] to make it easier to work with assets.
/// {@endtemplate}
extension AssetsExtension on Assets {
  /// Returns the current flavors splash screen path
  static AssetGenImage splashScreen(Flavor flavor) {
    switch (flavor) {
      case Flavor.development:
        return Assets.app.development.splashScreen;
      case Flavor.staging:
        return Assets.app.staging.splashScreen;
      case Flavor.production:
        return Assets.app.production.splashScreen;
    }
  }
}

/// {@template asset_gen_image_extension}
/// Methods to make working with asset images easier.
/// {@endtemplate}
extension AssetGenImageExtension on AssetGenImage {
  /// {@macro asset_gen_image_extension}
  ///
  /// [cache] pre-loads the image, so it can be used immediately when needed,
  /// without any delay.
  Future<void> cache() {
    final provider = AssetImage(path);
    final config = ImageConfiguration(
      bundle: rootBundle,
      devicePixelRatio: 1,
      platform: defaultTargetPlatform,
    );
    final completer = Completer<void>();
    final stream = provider.resolve(config);

    late final ImageStreamListener listener;

    listener = ImageStreamListener(
      (ImageInfo image, bool sync) {
        completer.complete();
        stream.removeListener(listener);
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        completer.complete();
        stream.removeListener(listener);
        FlutterError.reportError(
          FlutterErrorDetails(
            context: ErrorDescription('image failed to load'),
            library: 'image resource service',
            exception: exception as Object,
            stack: stackTrace,
            silent: true,
          ),
        );
      },
    );

    stream.addListener(listener);

    return completer.future;
  }
}
