import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'ProfilePage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'ProfileView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const ProfilePage(),
                ),
              );

              expect(
                find.byType(ProfileView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
