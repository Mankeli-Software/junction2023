import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameMenuState state;

  setUp(
    () {
      state = const GameMenuState();
    },
  );

  group(
    'GameMenuState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const GameMenuState(),
          );
        },
      );

      test(
        'status defaults to GameMenuStatus.initial '
        'always',
        () {
          expect(
            state.status,
            GameMenuStatus.initializing,
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
                  status: GameMenuStatus.busy,
                ),
                const GameMenuState(
                  status: GameMenuStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
