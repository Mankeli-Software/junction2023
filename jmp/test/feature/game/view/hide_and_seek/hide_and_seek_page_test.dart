import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

import '../../../../test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(TestHelper.setUp);
  group(
    'HideAndSeekPage',
    () {
      group(
        'renders',
        () {
          testWidgets(
            'HideAndSeekView '
            'always',
            (tester) async {
              await tester.pumpWidget(
                TestHelper.bootstrap(
                  const HideAndSeekPage(),
                ),
              );

              expect(
                find.byType(HideAndSeekView),
                findsOneWidget,
              );
            },
          );
        },
      );
    },
  );
}
