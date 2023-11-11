import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameDetailsState state;

  setUp(
    () {
      state = const GameDetailsState();
    },
  );

  group(
    'GameDetailsState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const GameDetailsState(),
          );
        },
      );

      test(
        'status defaults to GameDetailsStatus.initial '
        'always',
        () {
          expect(
            state.status,
            GameDetailsStatus.initializing,
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
                  status: GameDetailsStatus.busy,
                ),
                const GameDetailsState(
                  status: GameDetailsStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
