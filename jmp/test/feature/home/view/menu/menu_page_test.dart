import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'MenuPage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'MenuView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const MenuPage(),
                ),
              );

              expect(
                find.byType(MenuView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
