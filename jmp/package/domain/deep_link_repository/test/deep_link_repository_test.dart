import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:firebase_core/firebase_core.dart';
// We actually do depend
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockDynamicLinkData extends Mock implements PendingDynamicLinkData {}

class MockShortDynamicLink extends Mock implements ShortDynamicLink {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FirebaseDynamicLinks dynamicLinks;
  late DeepLinkRepository deepLinkRepository;

  setUp(
    () async {
      registerFallbackValue(
        DynamicLinkParameters(
          uriPrefix: 'uriPrefix',
          link: Uri.parse('link'),
        ),
      );

      registerFallbackValue(
        <String, String>{},
      );
      const options = FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      );
      final platformApp = FirebaseAppPlatform(defaultFirebaseAppName, options);
      final firebaseCore = MockFirebaseCore();

      when(() => firebaseCore.apps).thenReturn([platformApp]);
      when(firebaseCore.app).thenReturn(platformApp);
      when(
        () => firebaseCore.initializeApp(
          name: defaultFirebaseAppName,
          options: options,
        ),
      ).thenAnswer((_) async => platformApp);
      Firebase.delegatePackingProperty = firebaseCore;
      dynamicLinks = MockFirebaseDynamicLinks();

      deepLinkRepository = DeepLinkRepository.mockable(
        dynamicLinks: dynamicLinks,
      );
    },
  );
  group(
    'LoggingRepository',
    () {
      test(
        'creates FirebaseDynamicLinks and RemoteActionRepository '
        'when not injected',
        () {
          expect(DeepLinkRepository.new, isNot(throwsException));
        },
      );

      group(
        'initialize',
        () {
          setUp(
            () {
              when(() => dynamicLinks.onLink)
                  .thenAnswer((_) => const Stream.empty());
              when(() => dynamicLinks.getInitialLink())
                  .thenAnswer((_) => Future.value());
            },
          );

          test(
            'calls onLink and getInitialLink '
            'when initialize is called',
            () async {
              await deepLinkRepository.initialize();

              verify(() => dynamicLinks.onLink).called(1);
              verify(() => dynamicLinks.getInitialLink()).called(1);
            },
          );
        },
      );

      group(
        'createDeepLink',
        () {
          test(
            'calls buildShortLink with correct parameters '
            'when createDeepLink is called',
            () async {
              const paramKey1 = 'paramKey1';
              const paramValue1 = 'paramValue1';
              const paramKey2 = 'paramKey2';
              const paramValue2 = 'paramValue2';

              const uriPath = '/path';
              const params = <String, String>{
                paramKey1: paramValue1,
                paramKey2: paramValue2,
              };
              const shortUri = 'https://example.com';

              const expectedUri =
                  '${DeepLinkRepository.kUriPrefix}$uriPath?$paramKey1=$paramValue1&$paramKey2=$paramValue2';

              final shortDynamicLink = MockShortDynamicLink();
              final pred = predicate<DynamicLinkParameters>(
                (p) => p.link.toString() == expectedUri,
              );

              when(
                () => dynamicLinks.buildShortLink(
                  any(
                    that: pred,
                  ),
                ),
              ).thenAnswer((_) => Future.value(shortDynamicLink));
              when(() => shortDynamicLink.shortUrl)
                  .thenReturn(Uri.parse(shortUri));

              final result = await deepLinkRepository.createDeepLink(
                uriPath: uriPath,
                parameters: params,
              );

              expect(result, shortUri);
              verify(() => dynamicLinks.buildShortLink(any(that: pred)))
                  .called(1);
              verify(() => shortDynamicLink.shortUrl).called(1);
            },
          );
        },
      );
    },
  );
}
