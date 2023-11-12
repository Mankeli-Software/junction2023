import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'ActionGamePage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'ActionGameView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const ActionGamePage(),
                ),
              );

              expect(
                find.byType(ActionGameView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
