import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockBalanceGameCubit extends Mock
    implements BalanceGameCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late BalanceGameCubit cubit;
  late BalanceGameState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockBalanceGameCubit();
      state = const BalanceGameState();

      when(() => cubit.initialize()).thenAnswer((_) {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<BalanceGameCubit>.value(
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
    'BalanceGameView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const BalanceGameView(),
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
