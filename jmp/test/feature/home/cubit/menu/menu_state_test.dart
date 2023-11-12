import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MenuState state;

  setUp(
    () {
      state = const MenuState();
    },
  );

  group(
    'MenuState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const MenuState(),
          );
        },
      );

      test(
        'status defaults to MenuStatus.initial '
        'always',
        () {
          expect(
            state.status,
            MenuStatus.initializing,
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
                  status: MenuStatus.busy,
                ),
                const MenuState(
                  status: MenuStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
