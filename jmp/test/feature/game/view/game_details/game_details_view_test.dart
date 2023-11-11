import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockGameDetailsCubit extends Mock
    implements GameDetailsCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameDetailsCubit cubit;
  late GameDetailsState state;
  late Widget Function(Widget) bootstrap;

  setUp(
    () {
      TestHelper.setUp();
      cubit = MockGameDetailsCubit();
      state = const GameDetailsState();

      when(() => cubit.initialize()).thenAnswer((_) {});

      when(() => cubit.state).thenReturn(state);
      when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

      bootstrap = (widget) => BlocProvider<GameDetailsCubit>.value(
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
    'GameDetailsView',
    () {
      testWidgets(
        'renders a Placeholder '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const GameDetailsView(),
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
