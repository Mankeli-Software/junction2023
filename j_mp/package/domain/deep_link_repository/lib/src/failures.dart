part of 'deep_link_repository.dart';
// ignore_for_file: prefer-match-file-name

/// {@template dynamic_link_failure}
/// Thrown when an error occurs in the [DeepLinkRepository].
/// {@endtemplate}
class DeepLinkFailure implements Exception {
  /// {@macro dynamic_link_failure}
  DeepLinkFailure() : message = 'Failed to get the dynamic link';

  /// The message of the failure.
  final String message;
}
