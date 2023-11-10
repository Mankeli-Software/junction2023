import 'package:flutter_test/flutter_test.dart';
import 'package:j_mp/feature/app/app.dart';

void main() {
  group(
    'AppState',
    () {
      test(
        'support value equality',
        () {
          expect(const AppState(), const AppState());
        },
      );

      test(
        'startupLogicStatus defaults to running',
        () {
          expect(
            const AppState(),
            const AppState(),
          );
        },
      );

      test(
        'lifecycleState defaults to detached',
        () {
          expect(
            const AppState(),
            const AppState(),
          );
        },
      );

      test(
        'copyWith returns the same object '
        'when no parameters are passed',
        () {
          expect(
            const AppState().copyWith(),
            const AppState(),
          );
        },
      );
    },
  );
}
