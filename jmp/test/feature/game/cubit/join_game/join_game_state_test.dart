import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late JoinGameState state;

  setUp(
    () {
      state = const JoinGameState();
    },
  );

  group(
    'JoinGameState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const JoinGameState(),
          );
        },
      );

      test(
        'status defaults to JoinGameStatus.initial '
        'always',
        () {
          expect(
            state.status,
            JoinGameStatus.initializing,
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
                  status: JoinGameStatus.busy,
                ),
                const JoinGameState(
                  status: JoinGameStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
