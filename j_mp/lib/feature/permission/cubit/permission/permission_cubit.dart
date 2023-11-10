part of 'permission.dart';

/// {@template permission_cubit}
/// A [Cubit] which handles requesting permissions from the user
/// {@endtemplate}
class PermissionCubit extends Cubit<PermissionState> {
  /// {@macro permission_cubit}
  PermissionCubit({
    required List<Permission> permissions,
    required this.permissionRepository,
  }) : super(PermissionState(permissionScope: permissions));

  /// The repository which manages the permissions
  final PermissionRepository permissionRepository;

  /// Initializes the cubit
  Future<void> initialize() {
    return refreshPermissionStatus();
  }

  /// Refreshes the permission status
  Future<void> refreshPermissionStatus({bool emitFetching = true}) async {
    if (emitFetching) {
      emit(state.copyWith(status: PermissionStateStatus.fetching));
    }
    await permissionRepository.refreshPermissions();
    final permanentlyDenied = permissionRepository.getPermissionsWithStatus(
      PermissionStatus.permanentlyDenied,
    );
    final limited = permissionRepository.getPermissionsWithStatus(
      PermissionStatus.limited,
    );

    final restricted = permissionRepository.getPermissionsWithStatus(
      PermissionStatus.restricted,
    );

    final denied = permissionRepository.getPermissionsWithStatus(
      PermissionStatus.denied,
    );

    final granted = permissionRepository.getPermissionsWithStatus(
      PermissionStatus.granted,
    );

    final permissions =
        state.permissionScope.where((p) => !granted.contains(p)).toList();

    emit(
      state.copyWith(
        status: PermissionStateStatus.idle,
        permissionScope: permissions,
        permissionsToGrant:
            [...denied, ...limited].where(permissions.contains).toList(),
        permanentlyDeniedPermissions:
            permanentlyDenied.where(permissions.contains).toList(),
        restrictedPermissions: restricted.where(permissions.contains).toList(),
      ),
    );
  }

  /// Requests the permissions which are not granted by the user and are grantable in the app
  Future<void> requestGrantablePermissions() async {
    emit(state.copyWith(status: PermissionStateStatus.fetching));

    await Future.wait(
      state.permissionsToGrant
          .map(permissionRepository.requestPermission)
          .toList(),
    );

    await refreshPermissionStatus(emitFetching: false);
  }

  /// Opens app settings
  Future<void> openAppSettings() async {
    await permissionRepository.openSettings();
  }
}
