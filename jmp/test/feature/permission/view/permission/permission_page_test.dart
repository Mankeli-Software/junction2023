import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jmp/feature/app/app.dart';
import 'package:jmp/feature/permission/view/permission/permission.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../test_helper.dart';

class MockAppCubit extends MockCubit<AppState> implements AppCubit {}

void main() async {
  final permissions = <Permission>[
    Permission.camera,
  ];

  late AppCubit appCubit;
  late Widget Function(Widget) bootstrap;
  group('PermissionPage', () {
    setUp(() {
      TestHelper.setUp();

      registerFallbackValue(PermissionStatus.granted);

      appCubit = MockAppCubit();

      bootstrap = (child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppCubit>.value(value: appCubit),
          ],
          child: TestHelper.bootstrap(child),
        );
      };

      when(() => TestHelper.router.pop(true)).thenAnswer((_) async => true);
      when(() => appCubit.state).thenReturn(const AppState());
      when(() => TestHelper.permissionRepository.refreshPermissions())
          .thenAnswer((_) async {
        return;
      });
      when(
        () => TestHelper.permissionRepository
            .getPermissionsWithStatus(any<PermissionStatus>()),
      ).thenAnswer((_) {
        return [];
      });
    });
    group('renders', () {
      testWidgets(
        'PermissionForm '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              PermissionPage(
                permissions: permissions,
                onResult: ({bool success = true}) {},
              ),
            ),
          );

          expect(
            find.byType(PermissionForm),
            findsOneWidget,
          );
        },
      );
    });
  });
}
