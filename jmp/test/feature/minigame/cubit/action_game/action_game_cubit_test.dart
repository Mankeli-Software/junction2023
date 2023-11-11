import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ActionGameCubit cubit;

  setUp(
    () {
      cubit = ActionGameCubit();
    },
  );
  group(
    'ActionGameCubit',
    () {
      blocTest<ActionGameCubit, ActionGameState>(
        'constructor is pure (no side-effects) '
        'always',
        build: ActionGameCubit.new,
        expect: () => const <ActionGameState>[],
      );

      group(
        'initialize',
        () {
          blocTest<ActionGameCubit, ActionGameState>(
            'emits ActionGameStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <ActionGameState>[
              ActionGameState(
                status: ActionGameStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
