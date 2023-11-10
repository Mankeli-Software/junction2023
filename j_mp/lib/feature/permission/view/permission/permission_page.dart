part of 'permission.dart';

/// {@template permission_page}
///  A page for requesting permissions from the user.
/// {@endtemplate}
@RoutePage()
class PermissionPage extends StatelessWidget {
  /// {@macro permission_page}
  const PermissionPage({
    super.key,
    required this.permissions,
    required this.onResult,
  });

  /// A callback that is called when the user has granted all permissions.
  final void Function({bool success}) onResult;

  /// The permissions to request from the user
  final List<Permission> permissions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PermissionCubit>(
        create: (context) => PermissionCubit(
          permissions: permissions,
          permissionRepository: context.read<PermissionRepository>(),
        )..initialize(),
        child: PermissionForm(
          onResult: onResult,
        ),
      ),
    );
  }
}
