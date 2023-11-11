import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MenuCubit cubit;

  setUp(
    () {
      cubit = MenuCubit();
    },
  );
  group(
    'MenuCubit',
    () {
      blocTest<MenuCubit, MenuState>(
        'constructor is pure (no side-effects) '
        'always',
        build: MenuCubit.new,
        expect: () => const <MenuState>[],
      );

      group(
        'initialize',
        () {
          blocTest<MenuCubit, MenuState>(
            'emits MenuStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <MenuState>[
              MenuState(
                status: MenuStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
