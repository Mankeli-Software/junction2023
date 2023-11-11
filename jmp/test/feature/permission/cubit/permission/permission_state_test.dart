// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/permission/cubit/permission/permission.dart';

void main() {
  group('PermissionState', () {
    test('support value equality', () {
      expect(const PermissionState(), const PermissionState());
    });

    test('permissionScope defaults to empty list', () {
      expect(
        const PermissionState(),
        const PermissionState(
          permissionScope: [],
        ),
      );
    });

    test('permissionsToGrant defaults to empty list', () {
      expect(
        const PermissionState(),
        const PermissionState(
          permissionsToGrant: [],
        ),
      );
    });

    test('permanentlyDeniedPermissions defaults to empty list', () {
      expect(
        const PermissionState(),
        const PermissionState(
          permanentlyDeniedPermissions: [],
        ),
      );
    });

    test('restrictedPermissions defaults to empty list', () {
      expect(
        const PermissionState(),
        const PermissionState(
          restrictedPermissions: [],
        ),
      );
    });

    test('status defaults to fetching', () {
      expect(
        const PermissionState(),
        const PermissionState(
          status: PermissionStateStatus.fetching,
        ),
      );
    });

    test(
      'copyWith returns the same object '
      'when no parameters are passed',
      () {
        expect(
          const PermissionState().copyWith(),
          const PermissionState(),
        );
      },
    );
  });
}
