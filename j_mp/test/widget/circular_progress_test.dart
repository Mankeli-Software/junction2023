import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/widget/widget.dart';

import '../test_helper.dart';

void main() {
  group(
    'CircularProgress',
    () {
      setUp(TestHelper.setUp);
      testWidgets(
        'renders SpinKitCircle',
        (tester) async {
          await tester.pumpWidget(
            TestHelper.bootstrap(
              const CircularProgress(),
            ),
          );
          expect(find.byType(SpinKitCircle), findsOneWidget);
        },
      );
    },
  );
}
