part of 'authentication_repository.dart';
// ignore_for_file: prefer-match-file-name

/// {@template sign_in_with_email_and_password_failure_code}
/// Failure codes for authentication errors.
/// {@endtemplate}
enum AuthenticationFailureStatus {
  /// {@template invalid_email}
  /// Indicates that the email address is malformed.
  /// {@endtemplate}
  invalidEmail,

  /// {@template email_already_in_use}
  /// Indicates that the email address is taken
  /// {@endtemplate}
  emailAlreadyInUse,

  /// {@template wrong_password}
  /// Indicates that the password is invalid.
  /// {@endtemplate}
  wrongPassword,

  /// {@template operation_not_allowed}
  /// Indicates that the given authentication method is not in use for the app
  /// {@endtemplate}
  operationNotAllowed,

  /// {@template weak_password}
  /// Indicates that the password is weak.
  /// {@endtemplate}
  weakPassword,

  /// {@template user_disabled}
  /// Indicates that the user account has been disabled by an administrator.
  /// {@endtemplate}
  userDisabled,

  /// {@template user_not_found}
  /// Indicates that there is no user corresponding to the given email address.
  /// {@endtemplate}
  userNotFound,

  /// {@template account_exists_with_different_credential}
  /// Indicates that that there is an account with the given email and different sign in method.
  /// Resolve this by calling fetchSignInMethodsForEmail and then asking the user to sign in using one of the returned providers. Once the user is signed in, the original credential can be linked to the user with linkWithCredential
  /// {@endtemplate}
  accountExistsWithDifferentCredential,

  /// {@template invalid_credential}
  /// Indicates that the given credential is malformed or has expired.
  /// {@endtemplate}
  invalidCredential,

  /// {@template invalid_verification_code}
  /// Indicates that the given phone auth verification code is invalid.
  /// {@endtemplate}
  invalidVerificationCode,

  /// {@template invalid_verification_id}
  /// Indicates that the given phone auth verification ID is invalid.
  /// {@endtemplate}
  invalidVerificationId,

  /// {@template requires_recent_login}
  /// Indicates that the user needs to re-authenticate (log out, log in again) in order to do the action.
  /// {@endtemplate}
  requiresRecentLogin,

  /// {@template missing_android_pkg_name}
  /// Indicates that an Android package name must be provided if the Android app is required to be installed.
  /// {@endtemplate}
  missingAndroidPkgName,

  /// {@template missing_continue_uri}
  /// Indicates that a continue URL must be provided in the request.
  /// {@endtemplate}
  missingContinueUri,

  /// {@template missing_ios_bundle_id}
  /// Indicates that an iOS Bundle ID must be provided if an App Store ID is provided.
  /// {@endtemplate}
  missingIosBundleId,

  /// {@template invalid_continue_uri}
  /// Indicates that the continue URL provided in the request is invalid.
  /// {@endtemplate}
  invalidContinueUri,

  /// {@template unauthorized_continue_uri}
  /// Indicates that the domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
  /// {@endtemplate}
  unauthorizedContinueUri,

  /// {@template expired_action_code}
  /// Indicates that the password reset action code is expired
  /// {@endtemplate}
  expiredActionCode,

  /// {@template invalid_action_code}
  /// Indicates that the password reset action code is malformed or has already been used.
  /// {@endtemplate}
  invalidActionCode,

  /// {@template unauthenticated}
  /// Indicates that the user is not authenticated and thus cannot complete the action.
  /// {@endtemplate}
  unauthenticated,

  /// {@template unknown}
  /// Indicates unknown error
  /// {@endtemplate}
  unknown,
}

/// {@template sign_up_with_email_and_password}
/// Thrown during email+password sign up process if a failure occurs
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password}
  factory SignUpWithEmailAndPasswordFailure.fromCode(String? code) {
    switch (code) {
      case kEmailAlreadyInUseError:
        return const SignUpWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.emailAlreadyInUse,
        );
      case kInvalidEmailError:
        return const SignUpWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.invalidEmail,
        );
      case kOperationNotAllowedError:
        return const SignUpWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.operationNotAllowed,
        );
      case kWeakPasswordError:
        return const SignUpWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.weakPassword,
        );
      default:
        return const SignUpWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.unknown,
        );
    }
  }

  const SignUpWithEmailAndPasswordFailure._(this.status) : message = 'Sign up with email and password failed';

  /// {@macro sign_up_with_email_and_password_failure}
  final AuthenticationFailureStatus status;

  /// {@macro sign_up_with_email_and_password_failure}
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the email+password login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class SignInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  factory SignInWithEmailAndPasswordFailure.fromCode(String? code) {
    switch (code) {
      case kInvalidEmailError:
        return const SignInWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.invalidEmail,
        );
      case kUserDisabledError:
        return const SignInWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.userDisabled,
        );
      case kUserNotFoundError:
        return const SignInWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.userNotFound,
        );
      case kWrongPasswordError:
        return const SignInWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.wrongPassword,
        );
      default:
        return const SignInWithEmailAndPasswordFailure._(
          AuthenticationFailureStatus.unknown,
        );
    }
  }

  const SignInWithEmailAndPasswordFailure._(this.status) : message = 'Sign in with email and password failed';

  /// {@macro log_in_with_email_and_password_failure}
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  final AuthenticationFailureStatus status;
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class SignInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const SignInWithGoogleFailure._(this.status) : message = 'Sign in with google failed';

  /// {@macro log_in_with_google_failure}
  factory SignInWithGoogleFailure.fromCode(String? code) {
    switch (code) {
      case kAccountExistsWithDifferentCredentialError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.accountExistsWithDifferentCredential,
        );
      case kInvalidCredentialError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.invalidCredential,
        );
      case kOperationNotAllowedError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.operationNotAllowed,
        );
      case kUserDisabledError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.userDisabled,
        );
      case kUserNotFoundError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.userNotFound,
        );
      case kWrongPasswordError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.wrongPassword,
        );
      case kInvalidActionCodeError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.invalidVerificationCode,
        );
      case kInvalidVerificationIdError:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.invalidVerificationId,
        );
      default:
        return const SignInWithGoogleFailure._(
          AuthenticationFailureStatus.unknown,
        );
    }
  }

  /// {@macro log_in_with_google_failure}
  final String message;

  /// {@macro log_in_with_google_failure}
  final AuthenticationFailureStatus status;
}

/// {@template email_lookup_failure}
/// Thrown during the email lookup process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/fetchSignInMethodsForEmail.html
/// {@endtemplate}
class EmailLookupFailure implements Exception {
  const EmailLookupFailure._(this.status) : message = 'Email lookup failed';

  /// {@macro email_lookup_failure}
  factory EmailLookupFailure.fromCode(String? code) {
    switch (code) {
      case kInvalidEmailError:
        return const EmailLookupFailure._(
          AuthenticationFailureStatus.invalidEmail,
        );
      default:
        return const EmailLookupFailure._(AuthenticationFailureStatus.unknown);
    }
  }

  /// {@macro email_lookup_failure}
  final String message;

  /// {@macro email_lookup_failure}
  final AuthenticationFailureStatus status;
}

/// {@template delete_user_failure}
/// Thrown during the delete user process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/delete.html
/// {@endtemplate}
class DeleteUserFailure implements Exception {
  const DeleteUserFailure._(this.status) : message = 'Delete user failed';

  /// {@macro delete_user_failure}
  factory DeleteUserFailure.fromCode(String? code) {
    switch (code) {
      case kRequiresRecentLoginError:
        return const DeleteUserFailure._(
          AuthenticationFailureStatus.requiresRecentLogin,
        );
      case kUnauthenticatedError:
        return const DeleteUserFailure._(
          AuthenticationFailureStatus.unauthenticated,
        );
      default:
        return const DeleteUserFailure._(AuthenticationFailureStatus.unknown);
    }
  }

  /// {@macro delete_user_failure}
  final String message;

  /// {@macro delete_user_failure}
  final AuthenticationFailureStatus status;
}

/// {@template password_reset_request_failure}
/// Thrown during the password reset request process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/sendPasswordResetEmail.html
/// {@endtemplate}
class PasswordResetRequestFailure implements Exception {
  const PasswordResetRequestFailure._(this.status) : message = 'Password reset request failed';

  /// {@macro password_reset_request_failure}
  factory PasswordResetRequestFailure.fromCode(String? code) {
    const prefix = 'auth/';
    switch (code!.replaceFirst(prefix, '')) {
      case kInvalidEmailError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.invalidEmail,
        );
      case kMissingAndroidPkgNameError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.missingAndroidPkgName,
        );
      case kMissingContinueUriError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.missingContinueUri,
        );
      case kMissingIosBundleIdError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.missingIosBundleId,
        );
      case kInvalidContinueUriError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.invalidContinueUri,
        );
      case kUnauthorizedContinueUriError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.unauthorizedContinueUri,
        );
      case kUserNotFoundError:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.userNotFound,
        );
      default:
        return const PasswordResetRequestFailure._(
          AuthenticationFailureStatus.unknown,
        );
    }
  }

  /// {@macro password_reset_request_failure}
  final String message;

  /// {@macro password_reset_request_failure}
  final AuthenticationFailureStatus status;
}

/// {@template save_user_failure}
/// Thrown during the save user process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updateEmail.html
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updateDisplayName.html
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User/updatePhotoURL.html
/// {@endtemplate}
class SaveUserFailure implements Exception {
  const SaveUserFailure._(this.status) : message = 'Save user failed';

  /// {@macro save_user_failure}
  factory SaveUserFailure.fromCode(String? code) {
    switch (code) {
      case kInvalidEmailError:
        return const SaveUserFailure._(
          AuthenticationFailureStatus.invalidEmail,
        );
      case kEmailAlreadyInUseError:
        return const SaveUserFailure._(
          AuthenticationFailureStatus.emailAlreadyInUse,
        );
      case kRequiresRecentLoginError:
        return const SaveUserFailure._(
          AuthenticationFailureStatus.requiresRecentLogin,
        );
      default:
        return const SaveUserFailure._(AuthenticationFailureStatus.unknown);
    }
  }

  /// {@macro save_user_failure}
  final String message;

  /// {@macro save_user_failure}
  final AuthenticationFailureStatus status;
}

/// {@template password_reset_confirmation_failure}
/// Thrown during the password reset confirmation process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/confirmPasswordReset.html
class PasswordResetConfirmationFailure implements Exception {
  const PasswordResetConfirmationFailure._(this.status) : message = 'Password reset confirmation failed';

  /// {@macro password_reset_confirmation_failure}
  factory PasswordResetConfirmationFailure.fromCode(String? code) {
    switch (code) {
      case kExpiredActionCodeError:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.expiredActionCode,
        );
      case kInvalidActionCodeError:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.invalidActionCode,
        );
      case kUserDisabledError:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.userDisabled,
        );
      case kUserNotFoundError:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.userNotFound,
        );
      case kWeakPasswordError:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.weakPassword,
        );
      default:
        return const PasswordResetConfirmationFailure._(
          AuthenticationFailureStatus.unknown,
        );
    }
  }

  /// {@macro password_reset_confirmation_failure}
  final String message;

  /// {@macro password_reset_confirmation_failure}
  final AuthenticationFailureStatus status;
}

/// {@template sign_out_failure}
/// Thrown during the logout process if a failure occurs.
/// {@endtemplate}
class SignOutFailure implements Exception {
  const SignOutFailure._(this.status) : message = 'Sign out failed';

  /// {@macro sign_out_failure}
  factory SignOutFailure.fromCode(String? code) {
    switch (code) {
      case kRequiresRecentLoginError:
        return const SignOutFailure._(
          AuthenticationFailureStatus.requiresRecentLogin,
        );
      case kUnauthenticatedError:
        return const SignOutFailure._(
          AuthenticationFailureStatus.unauthenticated,
        );
      default:
        return const SignOutFailure._(AuthenticationFailureStatus.unknown);
    }
  }

  /// {@macro sign_out_failure}
  final String message;

  /// {@macro sign_out_failure}
  final AuthenticationFailureStatus status;
}
