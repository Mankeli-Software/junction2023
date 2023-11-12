import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'BalanceGamePage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'BalanceGameView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const BalanceGamePage(),
                ),
              );

              expect(
                find.byType(BalanceGameView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
