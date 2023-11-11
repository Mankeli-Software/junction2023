import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'HomePage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'HomeView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const HomePage(isTest: true),
                ),
              );

              expect(
                find.byType(HomeView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
