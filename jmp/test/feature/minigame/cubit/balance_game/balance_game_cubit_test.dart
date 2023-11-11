import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late BalanceGameCubit cubit;

  setUp(
    () {
      cubit = BalanceGameCubit();
    },
  );
  group(
    'BalanceGameCubit',
    () {
      blocTest<BalanceGameCubit, BalanceGameState>(
        'constructor is pure (no side-effects) '
        'always',
        build: BalanceGameCubit.new,
        expect: () => const <BalanceGameState>[],
      );

      group(
        'initialize',
        () {
          blocTest<BalanceGameCubit, BalanceGameState>(
            'emits BalanceGameStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <BalanceGameState>[
              BalanceGameState(
                status: BalanceGameStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
