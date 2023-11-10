part of 'authentication_repository.dart';

/// {@template authentication_error_codes}
/// Error codes that can be returned by the Firebase Authentication SDK.
/// {@endtemplate}

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidEmailError = 'invalid-email';

/// {@macro authentication_error_codes}
@visibleForTesting
const kEmailAlreadyInUseError = 'email-already-in-use';

/// {@macro authentication_error_codes}
@visibleForTesting
const kOperationNotAllowedError = 'operation-not-allowed';

/// {@macro authentication_error_codes}
@visibleForTesting
const kWeakPasswordError = 'weak-password';

/// {@macro authentication_error_codes}
@visibleForTesting
const kUserDisabledError = 'user-disabled';

/// {@macro authentication_error_codes}
@visibleForTesting
const kUserNotFoundError = 'user-not-found';

/// {@macro authentication_error_codes}
@visibleForTesting
const kWrongPasswordError = 'wrong-password';

/// {@macro authentication_error_codes}
// ignore: prefer-correct-identifier-length
@visibleForTesting
// The variable is named after the error code and thus should not be altered.
// ignore: prefer-correct-identifier-length
const kAccountExistsWithDifferentCredentialError = 'account-exists-with-different-credential';

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidCredentialError = 'invalid-credential';

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidVerificationCodeError = 'invalid-verification-code';

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidVerificationIdError = 'invalid-verification-id';

/// {@macro authentication_error_codes}
@visibleForTesting
const kRequiresRecentLoginError = 'requires-recent-login';

/// {@macro authentication_error_codes}
@visibleForTesting
const kUnauthenticatedError = 'unauthenticated';

/// {@macro authentication_error_codes}
@visibleForTesting
const kMissingAndroidPkgNameError = 'missing-android-pkg-name';

/// {@macro authentication_error_codes}
@visibleForTesting
const kMissingContinueUriError = 'missing-continue-uri';

/// {@macro authentication_error_codes}
@visibleForTesting
const kMissingIosBundleIdError = 'missing-ios-bundle-id';

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidContinueUriError = 'invalid-continue-uri';

/// {@macro authentication_error_codes}
@visibleForTesting
const kUnauthorizedContinueUriError = 'unauthorized-continue-uri';

/// {@macro authentication_error_codes}
@visibleForTesting
const kExpiredActionCodeError = 'expired-action-code';

/// {@macro authentication_error_codes}
@visibleForTesting
const kInvalidActionCodeError = 'invalid-action-code';
