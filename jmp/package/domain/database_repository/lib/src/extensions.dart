part of 'database_repository.dart';
// ignore_for_file: prefer-match-file-name

/// {@template user_extension}
/// Database related extensions on User model.
/// {@endtemplate}
@visibleForTesting
extension UserExtension on User {
  /// {@macro user_extension}
  ///
  ///
  /// [fromDocumentSnapshot] creates a [User] from a [DocumentSnapshot].
  /// If the document referenced in DocumentSnapshot does not exist, or the snapshot
  /// is empty, [User.empty] is returned.
  static User fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data() as Map<String, dynamic>?;
    if (!snapshot.exists || json == null) return User.empty;
    json['id'] = snapshot.id;

    return User.fromJson(json);
  }
}
