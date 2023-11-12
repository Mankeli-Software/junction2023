import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockGameMenuCubit extends Mock
    implements GameMenuCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameMenuCubit cubit;
  late GameMenuState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockGameMenuCubit();
      state = const GameMenuState();

      when(() => cubit.initialize()).thenAnswer((_) {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<GameMenuCubit>.value(
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
    'GameMenuView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const GameMenuView(),
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
