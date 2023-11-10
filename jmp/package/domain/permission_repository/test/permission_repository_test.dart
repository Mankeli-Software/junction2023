import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_repository/permission_repository.dart';

class MockPermission extends Mock implements Permission {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Permission is hard to test... Until a good way is figured out, we'll just test the creation of the repo.

  group('PermissionRepository', () {
    test(
      'creating does not throw '
      'always',
      () {
        expect(PermissionRepository.new, isNot(throwsException));
      },
    );
    // late Permission permission;
    // late PermissionRepository permissionRepository;

    // setUp(() {
    //   permission = MockPermission();

    //   when(() => permission.value).thenReturn(0);
    //   permissionRepository = PermissionRepository.mockable(
    //     requiredConfig: {permission: PermissionStatus.granted},
    //   );
    // });

    // test('initialize', () {
    //   const status = PermissionStatus.denied;

    //   when(() => permission.status).thenAnswer((_) async => status);
    //   permissionRepository.initialize();
    //   expect(permissionRepository.currentConfig[permission], status);
    // });
  });
}
