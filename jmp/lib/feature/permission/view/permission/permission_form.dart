part of 'permission.dart';

/// {@template permission_form}
/// A form that handles the permission requesting flow.
/// {@endtemplate}
class PermissionForm extends StatelessWidget {
  /// {@macro permission_form}
  const PermissionForm({
    super.key,
    required this.onResult,
  });

  /// A callback that is called when the user has granted all permissions.
  final void Function({bool success}) onResult;

  /// {@macro permission_form}
  @visibleForTesting
  static const kPermanentlyDeniedPermissionsKey =
      Key('PermissionForm_permanentlyDeniedPermissions');

  /// {@macro permission_form}
  @visibleForTesting
  static const kRestrictedPermissionsKey =
      Key('PermissionForm_restrictedPermissions');

  /// {@macro permission_form}
  @visibleForTesting
  static const kPermissionsToGrantKey =
      Key('PermissionForm_permissionsToGrant');

  /// {@macro permission_form}
  @visibleForTesting
  static const kGrantButtonKey = Key('PermissionForm_grantButton');

  /// {@macro permission_form}
  @visibleForTesting
  static const kOpenSettingsButtonKey =
      Key('PermissionForm_openSettingsButton');

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final localizations = context.localizations;

    return BlocListener<AppCubit, AppState>(
      listenWhen: (p, c) =>
          p.lifecycleState != c.lifecycleState &&
          c.lifecycleState == AppLifecycleState.resumed,
      listener: (context, state) =>
          context.read<PermissionCubit>().refreshPermissionStatus(),
      child: BlocConsumer<PermissionCubit, PermissionState>(
        listener: (_, state) async {
          if (state.permissionScope.isEmpty) {
            await context.router.pop(true);
            onResult(success: true);
          }
        },
        listenWhen: (_, state) => state.permissionScope.isEmpty,
        buildWhen: (_, state) => state.permissionScope.isEmpty,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 22,
            ),
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  localizations.insufficientPermissions,
                  style: theme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                if (state.permissionsToGrant.isNotEmpty)
                  Column(
                    key: kPermissionsToGrantKey,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        localizations.theFollowingPermissionsAreDenied,
                        style: theme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      _PermissionList(permissions: state.permissionsToGrant),
                      ElevatedButton(
                        key: kGrantButtonKey,
                        child: Text(
                          localizations.grantPermissions,
                        ),
                        onPressed: () => context
                            .read<PermissionCubit>()
                            .requestGrantablePermissions(),
                      ),
                    ],
                  ),
                if (state.permanentlyDeniedPermissions.isNotEmpty)
                  Column(
                    key: kPermanentlyDeniedPermissionsKey,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations
                            .theFollowingPermissionsArePermanentlyDenied,
                        style: theme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      _PermissionList(
                        permissions: state.permanentlyDeniedPermissions,
                      ),
                      ElevatedButton(
                        key: kOpenSettingsButtonKey,
                        child: Text(
                          localizations.openSettings,
                        ),
                        onPressed: () =>
                            context.read<PermissionCubit>().openAppSettings(),
                      ),
                    ],
                  ),
                if (state.restrictedPermissions.isNotEmpty)
                  Column(
                    key: kRestrictedPermissionsKey,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations.theFollowingPermissionsAreRestricted,
                        style: theme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      _PermissionList(permissions: state.restrictedPermissions),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PermissionList extends StatelessWidget {
  const _PermissionList({required this.permissions});

  final List<Permission> permissions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        ...permissions.map(
          (p) => Text(
            p.toString(),
            style: context.theme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
