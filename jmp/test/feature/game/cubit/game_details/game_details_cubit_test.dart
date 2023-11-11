import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/game/game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GameDetailsCubit cubit;

  setUp(
    () {
      cubit = GameDetailsCubit();
    },
  );
  group(
    'GameDetailsCubit',
    () {
      blocTest<GameDetailsCubit, GameDetailsState>(
        'constructor is pure (no side-effects) '
        'always',
        build: GameDetailsCubit.new,
        expect: () => const <GameDetailsState>[],
      );

      group(
        'initialize',
        () {
          blocTest<GameDetailsCubit, GameDetailsState>(
            'emits GameDetailsStatus.idle '
            'when function exceutes successfully',
            build: () => cubit,
            act: (c) => c.initialize(),
            expect: () => const <GameDetailsState>[
              GameDetailsState(
                status: GameDetailsStatus.idle,
              ),
            ],
          );
        },
      );
    },
  );
}
