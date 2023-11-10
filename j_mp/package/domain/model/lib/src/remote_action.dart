import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_action.g.dart';
part 'remote_action.gen.dart';

/// {@template remote_action}
/// A representation of a remote action sent by Firebase Deep Links or Push notifications.
/// {@endtemplate}
@Freezed(
  fromJson: true,
  toJson: true,
)
class RemoteAction with _$RemoteAction {
  /// {@macro remote_action}
  ///
  /// A remote action to push a new route
  const factory RemoteAction.pushRoute({
    required String routeName,
  }) = PushRouteAction;

  /// {@macro remote_action}
  ///
  /// An invalid remote action for when parameters are malformatted
  const factory RemoteAction.invalid() = InvalidRemoteAction;

  /// {@macro remote_action}
  factory RemoteAction.fromJson(Map<String, dynamic> json) {
    try {
      return _$RemoteActionFromJson(json);
    } catch (e) {
      return const RemoteAction.invalid();
    }
  }

  const RemoteAction._();

  /// Returns true if the json is valid for this action
  bool get isValid => this is! InvalidRemoteAction;
}
