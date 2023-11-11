import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/permission/cubit/permission/permission.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../test_helper.dart';

void main() {
  late List<Permission> permissions;
  late PermissionCubit permissionCubit;

  setUp(
    () {
      TestHelper.setUp();
      registerFallbackValue(Permission.camera);
      registerFallbackValue(PermissionStatus.denied);

      when(() => TestHelper.permissionRepository.openSettings())
          .thenAnswer((_) async => true);
      when(() => TestHelper.permissionRepository.refreshPermissions())
          .thenAnswer((_) async => true);
      when(
        () => TestHelper.permissionRepository.requestPermission(
          any<Permission>(),
        ),
      ).thenAnswer((_) async => true);
      when(
        () => TestHelper.permissionRepository.getPermissionsWithStatus(
          any<PermissionStatus>(),
        ),
      ).thenAnswer(
        (_) => [],
      );
      permissions = [
        Permission.camera,
        Permission.microphone,
      ];
      permissionCubit = PermissionCubit(
        permissionRepository: TestHelper.permissionRepository,
        permissions: permissions,
      );
    },
  );

  group(
    'PermissionCubit',
    () {
      group(
        'refreshPermissionStatus',
        () {
          blocTest<PermissionCubit, PermissionState>(
            'emits only at the end '
            'when emitFetching is false',
            build: () => permissionCubit,
            seed: PermissionState.new,
            act: (cubit) => cubit.refreshPermissionStatus(emitFetching: false),
            expect: () => [
              const PermissionState(
                status: PermissionStateStatus.idle,
              ),
            ],
          );

          blocTest<PermissionCubit, PermissionState>(
            'emits at the end and at the beginning '
            'when emitFetching is true',
            build: () => permissionCubit,
            seed: () =>
                const PermissionState(status: PermissionStateStatus.idle),
            act: (cubit) => cubit.refreshPermissionStatus(),
            expect: () => [
              const PermissionState(),
              const PermissionState(
                status: PermissionStateStatus.idle,
              ),
            ],
          );
          blocTest<PermissionCubit, PermissionState>(
            'calls all the necessary methods '
            'when called',
            build: () => permissionCubit,
            act: (cubit) => cubit.refreshPermissionStatus(),
            verify: (cubit) {
              verify(() => TestHelper.permissionRepository.refreshPermissions())
                  .called(1);
              verify(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.denied),
              ).called(1);
              verify(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.limited),
              ).called(1);
              verify(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.permanentlyDenied,
                ),
              ).called(1);
              verify(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.restricted),
              ).called(1);
              verify(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.granted),
              ).called(1);
            },
          );

          blocTest<PermissionCubit, PermissionState>(
            'returns only the permissions within the permissionScope '
            'always',
            build: () => permissionCubit,
            seed: () => const PermissionState(
              permissionScope: [
                Permission.camera,
                Permission.location,
              ],
            ),
            setUp: () {
              when(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.denied),
              ).thenAnswer(
                (_) => [
                  Permission.camera,
                  Permission.location,
                  Permission.audio,
                  Permission.contacts,
                ],
              );
            },
            act: (cubit) => cubit.refreshPermissionStatus(emitFetching: false),
            expect: () => [
              const PermissionState(
                status: PermissionStateStatus.idle,
                permissionScope: [
                  Permission.camera,
                  Permission.location,
                ],
                permissionsToGrant: [
                  Permission.camera,
                  Permission.location,
                ],
              ),
            ],
          );

          blocTest<PermissionCubit, PermissionState>(
            'removes permissions from permissionScope '
            'when granted',
            build: () => permissionCubit,
            seed: () => const PermissionState(
              permissionScope: [
                Permission.camera,
                Permission.location,
              ],
            ),
            setUp: () {
              when(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.granted),
              ).thenAnswer(
                (_) => [
                  Permission.camera,
                ],
              );
              when(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.denied),
              ).thenAnswer(
                (_) => [
                  Permission.location,
                ],
              );
            },
            act: (cubit) => cubit.refreshPermissionStatus(emitFetching: false),
            expect: () => [
              const PermissionState(
                status: PermissionStateStatus.idle,
                permissionScope: [
                  Permission.location,
                ],
                permissionsToGrant: [
                  Permission.location,
                ],
              ),
            ],
          );

          blocTest<PermissionCubit, PermissionState>(
            'permissionsToGrant is a combination of denied and limited '
            'always',
            build: () => permissionCubit,
            seed: () => const PermissionState(
              permissionScope: [
                Permission.camera,
                Permission.location,
              ],
            ),
            setUp: () {
              when(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.denied),
              ).thenAnswer(
                (_) => [
                  Permission.camera,
                ],
              );
              when(
                () => TestHelper.permissionRepository
                    .getPermissionsWithStatus(PermissionStatus.limited),
              ).thenAnswer(
                (_) => [
                  Permission.location,
                ],
              );
            },
            act: (cubit) => cubit.refreshPermissionStatus(emitFetching: false),
            expect: () => [
              const PermissionState(
                status: PermissionStateStatus.idle,
                permissionScope: [
                  Permission.camera,
                  Permission.location,
                ],
                permissionsToGrant: [
                  Permission.camera,
                  Permission.location,
                ],
              ),
            ],
          );
        },
      );
      group(
        'requestGrantablePermissions',
        () {
          blocTest<PermissionCubit, PermissionState>(
            'calls requestPermission onTestHelper.permissionRepository for each permission to grant '
            'when requestGrantablePermissions is called',
            build: () => permissionCubit,
            seed: () => PermissionState(
              status: PermissionStateStatus.idle,
              permissionScope: permissions,
              permanentlyDeniedPermissions: [],
              restrictedPermissions: [],
              permissionsToGrant: permissions,
            ),
            setUp: () {
              when(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.denied,
                ),
              ).thenReturn([]);
              when(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.limited,
                ),
              ).thenReturn([]);
              when(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.permanentlyDenied,
                ),
              ).thenReturn([]);
              when(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.restricted,
                ),
              ).thenReturn([]);
              when(
                () => TestHelper.permissionRepository.getPermissionsWithStatus(
                  PermissionStatus.granted,
                ),
              ).thenReturn(permissions);
            },
            act: (cubit) => cubit.requestGrantablePermissions(),
            expect: () => [
              PermissionState(
                permissionScope: permissions,
                permanentlyDeniedPermissions: [],
                restrictedPermissions: [],
                permissionsToGrant: permissions,
              ),
              const PermissionState(
                status: PermissionStateStatus.idle,
              ),
            ],
            verify: (_) {
              for (final permission in permissions) {
                verify(
                  () => TestHelper.permissionRepository
                      .requestPermission(permission),
                ).called(1);
              }
            },
          );
        },
      );

      group(
        'openAppSettings',
        () {
          blocTest<PermissionCubit, PermissionState>(
            'calls openSettings onTestHelper.permissionRepository '
            'when openAppSettings is called',
            build: () => permissionCubit,
            act: (cubit) => cubit.openAppSettings(),
            verify: (_) {
              verify(() => TestHelper.permissionRepository.openSettings())
                  .called(1);
            },
          );
        },
      );
    },
  );
}
