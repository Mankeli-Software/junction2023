import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late BalanceGameState state;

  setUp(
    () {
      state = const BalanceGameState();
    },
  );

  group(
    'BalanceGameState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const BalanceGameState(),
          );
        },
      );

      test(
        'status defaults to BalanceGameStatus.initial '
        'always',
        () {
          expect(
            state.status,
            BalanceGameStatus.initializing,
          );
        },
      );

      group(
        'copyWith',
        () {
          test(
            'returns new object with same parameters '
            'when no parameters are passed',
            () {
              expect(
                state.copyWith(),
                state,
              );
            },
          );

          test(
            'returns new object with same different parameters '
            'when parameters are passed',
            () {
              expect(
                state.copyWith(
                  status: BalanceGameStatus.busy,
                ),
                const BalanceGameState(
                  status: BalanceGameStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
