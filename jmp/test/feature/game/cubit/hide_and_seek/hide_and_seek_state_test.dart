import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HideAndSeekState state;

  setUp(
    () {
      state = const HideAndSeekState();
    },
  );

  group(
    'HideAndSeekState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const HideAndSeekState(),
          );
        },
      );

      test(
        'status defaults to HideAndSeekStatus.initial '
        'always',
        () {
          expect(
            state.status,
            HideAndSeekStatus.initializing,
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
                  status: HideAndSeekStatus.busy,
                ),
                const HideAndSeekState(
                  status: HideAndSeekStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
