import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeCubit cubit;

  setUp(
    () {
      cubit = HomeCubit();
    },
  );
  group(
    'HomeCubit',
    () {
      blocTest<HomeCubit, HomeState>(
        'constructor is pure (no side-effects) '
        'always',
        build: HomeCubit.new,
        expect: () => const <HomeState>[],
      );

      group(
        'initialize',
        () {
          blocTest<HomeCubit, HomeState>(
            'emits HomeStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <HomeState>[
              HomeState(
                status: HomeStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
