import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late JoinGameCubit cubit;

  setUp(
    () {
      cubit = JoinGameCubit();
    },
  );
  group(
    'JoinGameCubit',
    () {
      blocTest<JoinGameCubit, JoinGameState>(
        'constructor is pure (no side-effects) '
        'always',
        build: JoinGameCubit.new,
        expect: () => const <JoinGameState>[],
      );

      group(
        'initialize',
        () {
          blocTest<JoinGameCubit, JoinGameState>(
            'emits JoinGameStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <JoinGameState>[
              JoinGameState(
                status: JoinGameStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
