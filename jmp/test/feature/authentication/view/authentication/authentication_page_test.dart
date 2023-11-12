import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/authentication/view/authentication/authentication.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

void main() async {
  group('AuthenticationPage', () {
    setUp(() {
      TestHelper.setUp();
      when(() => TestHelper.authenticationRepository.authChanges)
          .thenAnswer((_) => const Stream.empty());
    });
    group('renders', () {
      testWidgets(
        'AuthenticationForm '
        'always',
        (tester) async {
          await tester.pumpWidget(
            TestHelper.bootstrap(
              const AuthenticationPage(),
            ),
          );

          expect(
            find.byType(AuthenticationForm),
            findsOneWidget,
          );
        },
      );
    });
  });
}
