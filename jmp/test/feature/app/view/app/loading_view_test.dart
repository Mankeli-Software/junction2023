import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/feature/app/view/app/app.dart';
import 'package:j_mp/feature/feature.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockAppCubit extends Mock implements AppCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppCubit cubit;
  late AppState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockAppCubit();
      state = const AppState();

      when(() => cubit.initialize()).thenAnswer((_) async {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<AppCubit>.value(
            value: cubit,
            child: Builder(
              builder: (context) {
                return TestHelper.bootstrap(
                  widget,
                );
              },
            ),
          );
    },
  );

  group(
    'AppView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const AppView(isTest: true),
            ),
          );

          expect(
            find.byType(Placeholder),
            findsOneWidget,
          );
        },
      );
    },
  );
}
