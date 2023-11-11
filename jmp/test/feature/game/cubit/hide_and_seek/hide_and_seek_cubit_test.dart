import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HideAndSeekCubit cubit;

  setUp(
    () {
      cubit = HideAndSeekCubit();
    },
  );
  group(
    'HideAndSeekCubit',
    () {
      blocTest<HideAndSeekCubit, HideAndSeekState>(
        'constructor is pure (no side-effects) '
        'always',
        build: HideAndSeekCubit.new,
        expect: () => const <HideAndSeekState>[],
      );

      group(
        'initialize',
        () {
          blocTest<HideAndSeekCubit, HideAndSeekState>(
            'emits HideAndSeekStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <HideAndSeekState>[
              HideAndSeekState(
                status: HideAndSeekStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
