import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:model/model.dart';

/// {@template deep_link}
/// A class represeting a deep link, which consists of a [remoteAction] and a
/// [data].
/// {@endtemplate}
class DeepLink {
  /// {@macro deep_link}
  DeepLink({
    required this.remoteAction,
    required this.data,
  });

  /// The remote action to be performed.
  ///
  /// NOTE: this is parsed from the deep link query parameters.
  final RemoteAction remoteAction;

  /// The raw data of the deep link.
  final PendingDynamicLinkData data;
}
