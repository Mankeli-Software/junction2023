import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/app/app.dart';
import 'package:jmp/feature/permission/cubit/permission/permission.dart';
import 'package:jmp/feature/permission/view/permission/permission.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../test_helper.dart';

class MockAppCubit extends MockCubit<AppState> implements AppCubit {}

class MockPermissionCubit extends MockCubit<PermissionState>
    implements PermissionCubit {}

void main() async {
  final permissions = <Permission>[
    Permission.camera,
  ];

  late AppCubit appCubit;
  late PermissionCubit permissionCubit;
  late Widget Function(Widget) bootstrap;

  group('PermissionForm', () {
    setUp(
      () {
        TestHelper.setUp();
        registerFallbackValue(PermissionStatus.granted);

        appCubit = MockAppCubit();
        permissionCubit = MockPermissionCubit();

        bootstrap = (child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AppCubit>.value(value: appCubit),
              BlocProvider<PermissionCubit>.value(value: permissionCubit),
            ],
            child: TestHelper.bootstrap(child),
          );
        };

        when(() => TestHelper.router.pop(true)).thenAnswer((_) async => true);
        when(() => appCubit.state).thenReturn(const AppState());
        when(
          () => TestHelper.permissionRepository.refreshPermissions(),
        ).thenAnswer(
          (_) async {
            return;
          },
        );
        when(
          () => TestHelper.permissionRepository.getPermissionsWithStatus(
            any<PermissionStatus>(),
          ),
        ).thenAnswer(
          (_) {
            return [];
          },
        );

        when(() => permissionCubit.requestGrantablePermissions()).thenAnswer(
          (_) async {
            return;
          },
        );

        when(() => permissionCubit.openAppSettings()).thenAnswer(
          (_) async {
            return;
          },
        );
      },
    );

    group('navigates', () {
      testWidgets(
        'to previouse route '
        'when all the necessary permissions are granted',
        (tester) async {
          when(() => permissionCubit.state)
              .thenReturn(PermissionState(permissionScope: permissions));
          whenListen(
            permissionCubit,
            Stream.fromIterable([
              PermissionState(permissionScope: permissions),
              const PermissionState(),
            ]),
          );

          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          await tester.pumpAndSettle();
          verify(() => TestHelper.router.pop(true)).called(1);
        },
      );
    });

    group(
      'calls',
      () {
        testWidgets(
          'requestGrantablePermissions '
          'when grant button is pressed',
          (tester) async {
            when(() => permissionCubit.state).thenReturn(
              PermissionState(
                permissionsToGrant: permissions,
              ),
            );
            await tester.pumpWidget(
              bootstrap(
                PermissionForm(
                  onResult: ({bool success = true}) {},
                ),
              ),
            );

            await tester.tap(find.byKey(PermissionForm.kGrantButtonKey));

            verify(() => permissionCubit.requestGrantablePermissions())
                .called(1);
          },
        );
        testWidgets(
          'openAppSettings '
          'when open settings button is pressed',
          (tester) async {
            when(() => permissionCubit.state).thenReturn(
              PermissionState(permanentlyDeniedPermissions: permissions),
            );
            await tester.pumpWidget(
              bootstrap(
                PermissionForm(
                  onResult: ({bool success = true}) {},
                ),
              ),
            );

            await tester.tap(find.byKey(PermissionForm.kOpenSettingsButtonKey));

            verify(() => permissionCubit.openAppSettings()).called(1);
          },
        );
      },
    );

    group('renders', () {
      testWidgets(
        'permissions to grant and grant button '
        'when permissionsToGrant is not empty',
        (tester) async {
          when(() => permissionCubit.state)
              .thenReturn(PermissionState(permissionsToGrant: permissions));
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byKey(PermissionForm.kPermissionsToGrantKey),
            findsOneWidget,
          );

          expect(
            find.byKey(PermissionForm.kGrantButtonKey),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'permanently denied permissions and open settings button '
        'when permanentlyDeniedPermissions is not empty',
        (tester) async {
          when(() => permissionCubit.state).thenReturn(
            PermissionState(permanentlyDeniedPermissions: permissions),
          );
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byKey(PermissionForm.kOpenSettingsButtonKey),
            findsOneWidget,
          );

          expect(
            find.byKey(PermissionForm.kPermanentlyDeniedPermissionsKey),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'restricted permissions  '
        'when restrictedPermissions is not empty',
        (tester) async {
          when(() => permissionCubit.state)
              .thenReturn(PermissionState(restrictedPermissions: permissions));
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byKey(PermissionForm.kRestrictedPermissionsKey),
            findsOneWidget,
          );
        },
      );
    });

    group('does not render', () {
      setUp(() {
        when(() => permissionCubit.state).thenReturn(const PermissionState());
      });
      testWidgets(
        'permissions to grant or grant button '
        'when permissionsToGrant is empty',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byKey(PermissionForm.kGrantButtonKey),
            findsNothing,
          );

          expect(
            find.byKey(PermissionForm.kPermissionsToGrantKey),
            findsNothing,
          );
        },
      );

      testWidgets(
        'permanently denied permissions or open settings button '
        'when permanentlyDeniedPermissions is empty',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );
          expect(
            find.byKey(PermissionForm.kOpenSettingsButtonKey),
            findsNothing,
          );

          expect(
            find.byKey(PermissionForm.kPermanentlyDeniedPermissionsKey),
            findsNothing,
          );
        },
      );

      testWidgets(
        'restricted permissions  '
        'when restrictedPermissions is empty',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              PermissionForm(
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byKey(PermissionForm.kRestrictedPermissionsKey),
            findsNothing,
          );
        },
      );
    });
  });
}
