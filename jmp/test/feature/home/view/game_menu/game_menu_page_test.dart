import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'GameMenuPage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'GameMenuView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const GameMenuPage(),
                ),
              );

              expect(
                find.byType(GameMenuView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
