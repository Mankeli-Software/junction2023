import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.gen.dart';

/// {@template user}
/// A representation of the apps users information.
/// {@endtemplate}
@freezed
class User with _$User {
  /// {@macro user}
  const factory User({
    /// The users unique identifier
    required String? id,

    /// The users email address
    required String? email,

    /// The users display name
    String? displayName,

    /// The users profile picture url
    String? photoUrl,

    /// The users notification tokens to be used when sending push notifications
    List<String>? notificationTokens,
  }) = _User;

  const User._();

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// A empty user to represent empty user
  static const empty = User(id: '', email: '');

  /// A empty user to represent unauthenticated user
  static const unAuthenticated = User(id: null, email: null);

  /// {@macro user_extension}
  ///
  /// [isEmpty] tells whether the [User] is empty
  bool get isEmpty => this == User.empty;

  /// {@macro user}
  ///
  /// [isNotEmpty] tells whether the [User] is not empty
  bool get isNotEmpty => !isEmpty;

  /// {@macro user}
  ///
  /// [isUnAuthenticated] tells whether the [User] is not authenticated
  bool get isUnAuthenticated => this == User.unAuthenticated;

  /// {@macro user}
  ///
  /// [isAuthenticated] tells whether the [User] is authenticated
  bool get isAuthenticated => !isUnAuthenticated;
}
