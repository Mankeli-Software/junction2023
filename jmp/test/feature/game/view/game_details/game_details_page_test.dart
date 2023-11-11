import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'GameDetailsPage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'GameDetailsView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const GameDetailsPage(),
                ),
              );

              expect(
                find.byType(GameDetailsView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
