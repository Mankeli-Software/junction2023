import 'package:analytic_repository/analytic_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
// We actually do depend, false lint.
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockAnalyticsRepository extends Mock implements AnalyticRepository {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AnalyticsRepository',
    () {
      late AnalyticRepository analyticsRepository;
      late FirebaseAnalytics firebaseAnalytics;

      setUp(() {
        const options = FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId',
        );
        final platformApp =
            FirebaseAppPlatform(defaultFirebaseAppName, options);
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

        firebaseAnalytics = MockFirebaseAnalytics();
        analyticsRepository =
            AnalyticRepository.mockable(analytics: firebaseAnalytics);
      });

      test(
        'creates FirebaseAnalytics instance '
        'when not injected',
        () {
          expect(AnalyticRepository.new, isNot(throwsException));
        },
      );

      test(
        'calls logAppOpen '
        'when logAppOpen is called',
        () {
          when(() => firebaseAnalytics.logAppOpen())
              .thenAnswer((_) async => {});
          analyticsRepository.logAppOpen();
          verify(() => firebaseAnalytics.logAppOpen()).called(1);
        },
      );

      test(
        'calls logScreenView '
        'when logRouteChange is called',
        () {
          const route = '/home';
          when(
            () => firebaseAnalytics.logScreenView(
              screenName: route,
              screenClass: route,
            ),
          ).thenAnswer(
            (_) async => {},
          );
          analyticsRepository.logRouteChange(route);
          verify(
            () => firebaseAnalytics.logScreenView(
              screenName: route,
              screenClass: route,
            ),
          ).called(1);
        },
      );

      group('logSignIn', () {
        test(
          'calls logLogin with method email/password with the correct method '
          'when called',
          () {
            const method = 'email/password';
            when(
              () => firebaseAnalytics.logLogin(loginMethod: method),
            ).thenAnswer((_) async => {});
            analyticsRepository.logSignIn(method);
            verify(
              () => firebaseAnalytics.logLogin(loginMethod: method),
            ).called(1);
          },
        );
      });

      group('logSignUp', () {
        test(
          'calls logSignUp with method email/password with the correct method '
          'when called ',
          () {
            const method = 'email/password';
            when(
              () => firebaseAnalytics.logSignUp(signUpMethod: method),
            ).thenAnswer((_) async => {});
            analyticsRepository.logSignUp(method);
            verify(
              () => firebaseAnalytics.logSignUp(signUpMethod: method),
            ).called(1);
          },
        );
      });

      group(
        'logEvent',
        () {
          test(
            'is called with name startup_logic_complete '
            'when logStartupLogicComplete is called',
            () {
              const name = 'startup_logic_complete';
              when(() => firebaseAnalytics.logEvent(name: name))
                  .thenAnswer((_) async => {});
              analyticsRepository.logStartupLogicComplete();
              verify(() => firebaseAnalytics.logEvent(name: name)).called(1);
            },
          );
        },
      );
    },
  );
}
