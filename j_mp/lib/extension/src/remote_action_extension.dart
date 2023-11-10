import 'package:auto_route/auto_route.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:model/model.dart';

/// {@template remote_action_extension}
/// Extension for [RemoteAction] to provide additional functionality.
/// {@endtemplate}
extension RemoteActionExtension on RemoteAction {
  /// {@macro remote_action_extension}
  ///
  /// [handle] handles the remote action
  Future<void> handle(StackRouter router) async {
    AppLogger.d('Handling remote action: $this');
    await when(
      pushRoute: (routeName) async {
        AppLogger.d('Pushing rout from remote action: $routeName');
        await router.navigateNamed(routeName);
      },
      invalid: () {
        AppLogger.d("Invalid remote action, won't do anything");
      },
    );
  }
}
