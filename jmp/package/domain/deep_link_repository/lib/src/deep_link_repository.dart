import 'dart:async';

import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';
import 'package:model/model.dart';

part 'failures.dart';

/// {@template deep_link_repository}
/// Repository which manages Firebase Dynamic Links.
///
/// Throws a [DeepLinkFailure] if fetching the dynamic link fails
/// {@endtemplate}
class DeepLinkRepository extends Repository {
  /// {@macro deep_link_repository}
  DeepLinkRepository({
    FirebaseApp? firebaseApp,
  }) : _dynamicLinks = FirebaseDynamicLinks.instanceFor(
          app: firebaseApp ?? Firebase.app(),
        );

  /// {@macro deep_link_repository}
  @visibleForTesting
  DeepLinkRepository.mockable({
    required FirebaseDynamicLinks dynamicLinks,
  }) : _dynamicLinks = dynamicLinks;

  final StreamController<DeepLink> _deepLinkController =
      StreamController.broadcast();

  /// The stream of deep links
  Stream<DeepLink> get deepLinks => _deepLinkController.stream;

  late final FirebaseDynamicLinks _dynamicLinks;

  /// * Your apps android package name, found in the AndroidManifest.xml
  @visibleForTesting
  static const kAndroidPackageName = 'your.package.name';

  /// * Your apps ios bundle id, found from `Runner.xcodeproj/project.pbxproj`
  @visibleForTesting
  static const kIosBundleId = 'your.bundle.id';

  /// * Your URI prefix defined in the Firebase console > Dynamic links.
  @visibleForTesting
  static const kUriPrefix = 'https://your.domain.com';

  /// * Your IOS app store ID, found from these instructions: https://learn.apptentive.com/knowledge-base/finding-your-app-store-id/
  @visibleForTesting
  static const kIosAppStoreId = '12345679';

  late StreamSubscription<PendingDynamicLinkData> _linkSubscription;

  /// Initializes dynamic links. IMPORTANT: Call this method before using any other methods in this class.
  @override
  Future<void> initialize() async {
    _linkSubscription = _dynamicLinks.onLink.listen(
      _handleDynamicLink,
      cancelOnError: false,
    );

    final data = await _dynamicLinks.getInitialLink();

    if (data != null) {
      await _handleDynamicLink(data);
    }

    return super.initialize();
  }

  /// The actual function that handles the dynamic link
  Future<void> _handleDynamicLink(PendingDynamicLinkData data) async {
    final remoteAction = RemoteAction.fromJson(data.link.queryParameters);

    _deepLinkController.add(
      DeepLink(
        remoteAction: remoteAction,
        data: data,
      ),
    );
  }

  /// Handles the creationi of deep links
  Future<String> createDeepLink({
    /// A custom URI path to be appended to the URI prefix. This parameter shall start with '/' and cannot end with '/'.
    /// Eg. the structure should look like: '/your/custom/path'
    String uriPath = '',

    /// Contains any additional parameters to the deep link.
    Map<String, String>? parameters,
  }) async {
    if (uriPath.isNotEmpty) {
      assert(
        uriPath.startsWith('/') && !uriPath.endsWith('/'),
        'uriPath must start with a "/" and cannot end with a "/"',
      );
    }
    var uri = '$kUriPrefix$uriPath';

    final stringParameters = parameters?.keys.map((key) {
      return '$key=${parameters[key]}';
    }).toList();

    if (stringParameters != null) {
      uri += '?${stringParameters.join('&')}';
    }

    final linkParameters = DynamicLinkParameters(
      uriPrefix: kUriPrefix,
      navigationInfoParameters: const NavigationInfoParameters(
        forcedRedirectEnabled: true,
      ),
      link: Uri.parse(uri),
      androidParameters: const AndroidParameters(
        packageName: kAndroidPackageName,
      ),
      iosParameters: const IOSParameters(
        bundleId: kIosBundleId,
        appStoreId: kIosAppStoreId,
      ),
    );

    final shortDynamicLink = await _dynamicLinks.buildShortLink(linkParameters);

    return shortDynamicLink.shortUrl.toString();
  }

  /// Cancels streams and disposes dynamic links
  @override
  Future<void> dispose() async {
    await _linkSubscription.cancel();
    await _deepLinkController.close();

    return super.dispose();
  }
}
