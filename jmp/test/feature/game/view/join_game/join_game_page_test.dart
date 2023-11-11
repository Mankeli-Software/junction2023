import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'JoinGamePage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'JoinGameView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const JoinGamePage(),
                ),
              );

              expect(
                find.byType(JoinGameView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
