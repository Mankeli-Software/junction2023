import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';
import 'package:model/model.dart' as model;

part 'constants.dart';
part 'failures.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository extends Repository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    FirebaseApp? firebaseApp,
  }) : _firebaseAuth =
            FirebaseAuth.instanceFor(app: firebaseApp ?? Firebase.app());

  /// {@macro authentication_repository}
  ///
  ///
  /// [AuthenticationRepository.mockable] Exposes the [FirebaseAuth] instance.
  @visibleForTesting
  AuthenticationRepository.mockable({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  late final FirebaseAuth _firebaseAuth;

  /// Signs out the currently logged in user. If the user is anonymous, deletes the user.
  ///
  /// Throws a [SignOutFailure] if there is no currently authenticated user.
  /// [AuthenticationFailureStatus] on [SignOutFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.unauthenticated]
  /// {@macro unauthenticated}
  /// - [AuthenticationFailureStatus.requiresRecentLogin]
  /// {@macro requires_recent_login}
  Future<void> signOut() async {
    try {
      final fbUser = _firebaseAuth.currentUser;

      if (fbUser == null) {
        throw SignOutFailure.fromCode(kUnauthenticatedError);
      }

      if (fbUser.isAnonymous) {
        /// Anonymous users have to be deleted, so that unnecessary users won't be
        /// left in Firebase Authentication.
        await fbUser.delete();
      } else {
        await _firebaseAuth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      throw SignOutFailure.fromCode(e.code);
    }
    AppLogger.a('sign-out');
  }

  /// Deletes the currently logged in user. This action requires a recent login to proceed.
  ///
  /// Throws [DeleteUserFailure] if there is no currently authenticated user or a more recent login is required.
  /// [AuthenticationFailureStatus] on [DeleteUserFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.requiresRecentLogin]:
  ///  {@macro requires_recent_login}
  ///
  /// - [AuthenticationFailureStatus.unauthenticated]:
  /// {@macro unauthenticated}
  Future<void> deleteUser() async {
    try {
      final fbUser = _firebaseAuth.currentUser;
      if (fbUser == null) {
        throw DeleteUserFailure.fromCode(kUnauthenticatedError);
      }

      await fbUser.delete();
    } on FirebaseAuthException catch (e) {
      throw DeleteUserFailure.fromCode(e.code);
    }
    AppLogger.a('delete-user');
  }

  /// Checks if user with given `email` exists in firebase authentication.
  ///
  /// If exists, returns `true`. If does not exist, returns `false`.
  /// Throws [EmailLookupFailure] if the email is invalid.
  /// [AuthenticationFailureStatus] on [EmailLookupFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.invalidEmail]:
  /// {@macro invalid_email}
  Future<bool> doesUserExist(String email) async {
    try {
      final signInMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      return signInMethods.isNotEmpty;
    } on FirebaseAuthException catch (e) {
      throw EmailLookupFailure.fromCode(e.code);
    }
  }

  /// Signs in to firebase authentication with the given `email` and `password`.
  ///
  /// Throws [SignInWithEmailAndPasswordFailure] if signing in failed.
  /// [AuthenticationFailureStatus] on [SignInWithEmailAndPasswordFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.invalidEmail]:
  /// {@macro invalid_email}
  /// - [AuthenticationFailureStatus.userDisabled]
  /// {@macro user_disabled}
  /// - [AuthenticationFailureStatus.wrongPassword]
  /// {@macro wrong_password}
  /// - [AuthenticationFailureStatus.userNotFound]
  /// {@macro user_not_found}
  /// - [AuthenticationFailureStatus.unknown]
  /// {@macro unknown}
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        throw SignInWithEmailAndPasswordFailure.fromCode(null);
      }
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    }
    AppLogger.a('sign-in');
  }

  /// Creates a new account to firebase using `email` and `password`.
  ///
  /// Throws [SignUpWithEmailAndPasswordFailure] if creating the user failed.
  /// [AuthenticationFailureStatus] on [SignUpWithEmailAndPasswordFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.invalidEmail]:
  /// {@macro invalid_email}
  /// - [AuthenticationFailureStatus.emailAlreadyInUse]
  /// {@macro email_already_in_use}
  /// - [AuthenticationFailureStatus.weakPassword]
  /// {@macro weak_password}
  /// - [AuthenticationFailureStatus.unknown]
  /// {@macro unknown}
  /// - [AuthenticationFailureStatus.operationNotAllowed]
  /// {@macro operation_not_allowed}
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        throw SignUpWithEmailAndPasswordFailure.fromCode(null);
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    }
    AppLogger.a('sign-up');
  }

  /// Sends password reset email to the given `email`.
  ///
  /// Throws [PasswordResetRequestFailure] if sending the email failed.
  /// [AuthenticationFailureStatus] on [PasswordResetRequestFailure] can be one of the following:
  ///
  /// - [AuthenticationFailureStatus.invalidEmail]
  /// {@macro invalid_email}
  /// - [AuthenticationFailureStatus.userNotFound]
  /// {@macro user_not_found}
  /// - [AuthenticationFailureStatus.missingAndroidPkgName]
  /// {@macro missing_android_pkg_name}
  /// - [AuthenticationFailureStatus.missingContinueUri]
  /// {@macro missing_continue_uri}
  /// - [AuthenticationFailureStatus.missingIosBundleId]
  /// {@macro missing_ios_bundle_id}
  /// - [AuthenticationFailureStatus.invalidContinueUri]
  /// {@macro invalid_continue_uri}
  /// - [AuthenticationFailureStatus.unauthorizedContinueUri]
  /// {@macro unauthorized_continue_uri}
  Future<void> requestPasswordReset({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw PasswordResetRequestFailure.fromCode(e.code);
    }

    AppLogger.a('request-password-reset');
  }

  /// Confirms password reset with the given `code` and `newPassword`.
  ///
  /// Throws [PasswordResetConfirmationFailure] if confirmation failed.
  /// [AuthenticationFailureStatus] on [PasswordResetConfirmationFailure] can be one of the following:
  ///
  ///
  /// - [AuthenticationFailureStatus.invalidActionCode]
  /// {@macro invalid_action_code}
  /// - [AuthenticationFailureStatus.expiredActionCode]
  /// {@macro expired_action_code}
  /// - [AuthenticationFailureStatus.userDisabled]
  /// {@macro user_disabled}
  /// - [AuthenticationFailureStatus.userNotFound]
  /// {@macro user_not_found}
  /// - [AuthenticationFailureStatus.weakPassword]
  /// {@macro weak_password}
  Future<void> confirmPasswordReset({
    required String newPassword,
    required String code,
  }) async {
    try {
      await _firebaseAuth.confirmPasswordReset(
        newPassword: newPassword,
        code: code,
      );
    } on FirebaseAuthException catch (e) {
      throw PasswordResetConfirmationFailure.fromCode(e.code);
    }
    AppLogger.a('confirm-password-reset');
  }

  /// Saves current users `photoUrl`, `email` and `displayName` to Firebase Authentication.
  ///
  /// Throws [SaveUserFailure] if saving the user failed.
  Future<void> saveCurrentUserData({
    required model.User user,
  }) async {
    try {
      final authUser = _firebaseAuth.currentUser!;
      if (user.email != authUser.email) {
        await _firebaseAuth.currentUser!.updateEmail(user.email!);
      }
      if (user.photoUrl != authUser.photoURL) {
        await _firebaseAuth.currentUser!.updatePhotoURL(user.photoUrl);
      }
      if (user.displayName != authUser.displayName) {
        await _firebaseAuth.currentUser!.updateDisplayName(user.displayName);
      }
    } on FirebaseAuthException catch (e) {
      throw SaveUserFailure.fromCode(e.code);
    }
  }

  /// Returns a stream of auth changes (Users). This stream is triggered when:
  /// 1. The listener is created
  /// 2. A user signs in
  /// 3. The current user signs out
  Stream<model.User> get authChanges =>
      _firebaseAuth.authStateChanges().asyncMap(_mapNewAuthUser);

  /// Runs some code on the user before returning the newly triggered user to authState stream.
  Future<model.User> _mapNewAuthUser(User? user) async {
    /// Stream is triggered by unauthenticated user.
    if (user == null) return model.User.unAuthenticated;

    /// Stream is triggered by authenticated user.
    return model.User(
      id: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
