import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockActionGameCubit extends Mock
    implements ActionGameCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ActionGameCubit cubit;
  late ActionGameState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockActionGameCubit();
      state = const ActionGameState();

      when(() => cubit.initialize()).thenAnswer((_) {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<ActionGameCubit>.value(
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
    'ActionGameView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const ActionGameView(),
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
