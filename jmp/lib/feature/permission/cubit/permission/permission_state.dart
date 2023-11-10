part of 'permission.dart';

/// {@template permission_state}
/// The state of the [PermissionCubit]
/// {@endtemplate}
@freezed
class PermissionState with _$PermissionState {
  /// {@macro permission_state}
  const factory PermissionState({
    /// The scope of the permissions which are to be requested for the given feature.
    @Default([]) List<Permission> permissionScope,

    /// Permissions that are denied or limited by the user
    @Default([]) List<Permission> permissionsToGrant,

    /// Permissions that are permanentlydenied by the user
    @Default([]) List<Permission> permanentlyDeniedPermissions,

    /// Permissions that are restricted by the phone (parental controls etc.)
    @Default([]) List<Permission> restrictedPermissions,

    /// {@macro permission_state_status}
    @Default(PermissionStateStatus.fetching) PermissionStateStatus status,
  }) = _PermissionState;
}

/// {@template permission_state_status}
/// The status of the permission state
/// {@endtemplate}
enum PermissionStateStatus {
  /// {@macro permission_state_status}
  fetching,

  /// {@macro permission_state_status}
  idle,
}
