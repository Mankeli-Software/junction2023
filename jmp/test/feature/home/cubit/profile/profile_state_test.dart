import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProfileState state;

  setUp(
    () {
      state = const ProfileState();
    },
  );

  group(
    'ProfileState',
    () {
      test(
        'supports value equality '
        'always',
        () {
          expect(
            state,
            const ProfileState(),
          );
        },
      );

      test(
        'status defaults to ProfileStatus.initial '
        'always',
        () {
          expect(
            state.status,
            ProfileStatus.initializing,
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
                  status: ProfileStatus.busy,
                ),
                const ProfileState(
                  status: ProfileStatus.busy,
                ),
              );
            },
          );
        },
      );
    },
  );
}
