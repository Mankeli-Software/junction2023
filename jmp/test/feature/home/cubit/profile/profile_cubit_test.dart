import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/home/home.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProfileCubit cubit;

  setUp(
    () {
      cubit = ProfileCubit();
    },
  );
  group(
    'ProfileCubit',
    () {
      blocTest<ProfileCubit, ProfileState>(
        'constructor is pure (no side-effects) '
        'always',
        build: ProfileCubit.new,
        expect: () => const <ProfileState>[],
      );

      group(
        'initialize',
        () {
          blocTest<ProfileCubit, ProfileState>(
            'emits ProfileStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <ProfileState>[
              ProfileState(
                status: ProfileStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
