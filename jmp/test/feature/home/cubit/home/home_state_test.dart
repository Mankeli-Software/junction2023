import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeState state;

  setUp(
    () {
      state = const HomeState();
    },
  );

  group(
    'HomeState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const HomeState(),
          );
        },
      );

      test(
        'status defaults to HomeStatus.initial '
        'always',
        () {
          expect(
            state.status,
            HomeStatus.initializing,
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
                  status: HomeStatus.busy,
                ),
                const HomeState(
                  status: HomeStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
