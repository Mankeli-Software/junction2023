import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameMenuCubit cubit;

  setUp(
    () {
      cubit = GameMenuCubit();
    },
  );
  group(
    'GameMenuCubit',
    () {
      blocTest<GameMenuCubit, GameMenuState>(
        'constructor is pure (no side-effects) '
        'always',
        build: GameMenuCubit.new,
        expect: () => const <GameMenuState>[],
      );

      group(
        'initialize',
        () {
          blocTest<GameMenuCubit, GameMenuState>(
            'emits GameMenuStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <GameMenuState>[
              GameMenuState(
                status: GameMenuStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
