import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

/// {@template permission_repository}
/// A repository which manages app permissions.
/// {@endtemplate}
class PermissionRepository extends Repository {
  /// {@macro permission_repository}
  PermissionRepository()
      : requiredConfig = <Permission, PermissionStatus>{
          /// Here is an example how the permissions should be added:
          // Permission.camera: PermissionStatus.granted,
        };

  /// {@macro permission_repository}
  @visibleForTesting
  PermissionRepository.mockable({
    required this.requiredConfig,
  });

  /// Ranks each status with a number. The higher the number, the more permission the user has.
  @visibleForTesting
  static const permissionStatusRanks = <PermissionStatus, int>{
    PermissionStatus.permanentlyDenied: 0,
    PermissionStatus.restricted: 1,
    PermissionStatus.denied: 2,
    PermissionStatus.limited: 3,
    PermissionStatus.provisional: 4,
    PermissionStatus.granted: 5,
  };

  /// This map contains all of the permissions that the app needs, along with their minimun status. See [permissionStatusRanks] for the rank of each status.
  @visibleForTesting
  final Map<Permission, PermissionStatus> requiredConfig;

  /// The current statuses for each of the permissions in [requiredConfig].
  @visibleForTesting
  final currentConfig = <Permission, PermissionStatus>{};

  /// Initializes the repository. Fetches current permision statuses for the permissions the app needs.
  @override
  Future<void> initialize() async {
    await refreshPermissions();

    return super.initialize();
  }

  /// Fetches the newest statuses for the permissions the app needs.
  Future<void> refreshPermissions() async {
    await Future.wait(
      requiredConfig.keys.map((permission) async {
        currentConfig[permission] = await permission.status;
      }).toList(),
    );
  }

  /// Returns `true` if the app has the permission with minimun required status. Otherwise, returns `false`.
  bool hasPermission(Permission permission) {
    assert(
      currentConfig.length == requiredConfig.length,
      'You must call initialize() before using this method',
    );
    assert(
      requiredConfig.containsKey(permission) &&
          currentConfig.containsKey(permission),
      'The permission $permission is not configured to be used within the app. Please add it to the _requiredConfig map in PermissionRepository',
    );
    final currentStatusRank = permissionStatusRanks[currentConfig[permission]];
    final requiredStatusRank =
        permissionStatusRanks[requiredConfig[permission]];

    return currentStatusRank! >= requiredStatusRank!;
  }

  /// Returns a list of permissions which have the given status.
  List<Permission> getPermissionsWithStatus(PermissionStatus status) {
    return currentConfig.keys
        .where(
          (key) => currentConfig[key] == status,
        )
        .toList();
  }

  /// Requests the permission from the user. Returns `true` if after the request the app has the permission with minimun required status. Otherwise, returns `false`.
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    currentConfig[permission] = status;

    return hasPermission(permission);
  }

  /// Opens the app settings page.
  Future<bool> openSettings() {
    return openAppSettings();
  }
}
