import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockMenuCubit extends Mock
    implements MenuCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MenuCubit cubit;
  late MenuState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockMenuCubit();
      state = const MenuState();

      when(() => cubit.initialize()).thenAnswer((_) {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<MenuCubit>.value(
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
    'MenuView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const MenuView(),
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
