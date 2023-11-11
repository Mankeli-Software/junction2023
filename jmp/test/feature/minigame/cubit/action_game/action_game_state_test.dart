import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/minigame/minigame.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ActionGameState state;

  setUp(
    () {
      state = const ActionGameState();
    },
  );

  group(
    'ActionGameState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const ActionGameState(),
          );
        },
      );

      test(
        'status defaults to ActionGameStatus.initial '
        'always',
        () {
          expect(
            state.status,
            ActionGameStatus.initializing,
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
                  status: ActionGameStatus.busy,
                ),
                const ActionGameState(
                  status: ActionGameStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
