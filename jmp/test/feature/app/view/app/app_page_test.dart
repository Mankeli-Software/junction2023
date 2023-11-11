import 'package:deep_link_repository/deep_link_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/app/view/app/app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';
import 'package:notification_repository/notification_repository.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestHelper.setUp();

    when(TestHelper.analyticRepository.logAppOpen).thenAnswer(
      (_) {},
    );

    when(TestHelper.analyticRepository.logStartupLogicComplete).thenAnswer(
      (_) {},
    );

    when(() => TestHelper.notificationRepository.notifications).thenAnswer(
      (_) => const Stream<PushNotification>.empty(),
    );

    when(() => TestHelper.deepLinkRepository.deepLinks).thenAnswer(
      (_) => const Stream<DeepLink>.empty(),
    );

    when(() => TestHelper.notificationRepository.tokenChanges).thenAnswer(
      (_) => const Stream<NotificationToken>.empty(),
    );

    when(() => TestHelper.authenticationRepository.authChanges).thenAnswer(
      (_) => const Stream<User>.empty(),
    );

    when(
      TestHelper.notificationRepository.allowInAppMessages,
    ).thenAnswer(
      (_) async {},
    );

    when(
      TestHelper.notificationRepository.requestPermission,
    ).thenAnswer(
      (_) async {},
    );

    when(
      TestHelper.databaseRepository.hasPromptedNotificationPermissions,
    ).thenAnswer((_) => false);

    when(
      TestHelper.databaseRepository.setNotificationPermissionsPrompted,
    ).thenAnswer(
      (_) async {},
    );
  });
  group(
    'AppPage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'AppView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const AppPage(isTest: true),
                ),
              );

              expect(
                find.byType(AppView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
