import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/extension/extension.dart';
import 'package:j_mp/main/launch_helper.dart';
import 'package:j_mp/resource/resource.dart';
import 'package:j_mp/utility/utility.dart';
import 'package:mocktail/mocktail.dart';

import '../test_helper.dart';

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  setUp(TestHelper.setUp);

  group('ContextExtension', () {
    testWidgets(
      'finds AppLocalizations '
      'when initialized properly',
      (tester) async {
        late BuildContext context;
        await tester.pumpWidget(
          TestHelper.bootstrap(
            Builder(
              builder: (c) {
                context = c;

                return const Placeholder();
              },
            ),
          ),
        );

        expect(context.localizations, isA<AppLocalizations>());
      },
    );

    testWidgets(
      'finds AppTheme '
      'when initialized properly',
      (tester) async {
        late BuildContext context;
        await tester.pumpWidget(
          TestHelper.bootstrap(
            Builder(
              builder: (c) {
                context = c;

                return const Placeholder();
              },
            ),
          ),
        );

        expect(context.theme, isA<AppTheme>());
      },
    );

    testWidgets(
      'finds flavor '
      'when initialized properly',
      (tester) async {
        late BuildContext context;
        await tester.pumpWidget(
          TestHelper.bootstrap(
            Builder(
              builder: (c) {
                context = c;

                return const Placeholder();
              },
            ),
          ),
        );

        expect(context.flavor, isA<Flavor>());
      },
    );
  });
}
