import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String authenticationFailure(String reason) {
    return 'Authentication failed: $reason';
  }

  @override
  String loadingProgress(Object progress) {
    return 'Loading - $progress%';
  }

  @override
  String personatedWelcomeText(Object personation) {
    return 'Hi,\n$personation!';
  }

  @override
  String passwordResetSent(Object email) {
    return 'Password reset email sent to  $email';
  }

  @override
  String get welcomeText => 'Welcome, fellow app user!';

  @override
  String get logInAgainToProceed => 'please log out and back in to proceed.';

  @override
  String get signingInFailed => 'signing in failed';

  @override
  String get signingUpFailed => 'signing up failed';

  @override
  String get passwordResetFailed => 'password reset failed';

  @override
  String get emailUpdateFailed => 'email update failed';

  @override
  String get invalidEmail => 'invalid email';

  @override
  String get invalidPassword => 'invalid password';

  @override
  String get passwordMustBeAtLeast8Characters => 'must be at least 8 characters long.';

  @override
  String get passwordMustContainNumber => 'must contain at least one number.';

  @override
  String get passwordMustContainCapitalLetter => 'must contain at least one capital letter.';

  @override
  String get passwordMustContainLowercaseLetter => 'must contain at least on lowercase letter.';

  @override
  String get unauthenticated => 'Cannot complete the action while unauthenticated';

  @override
  String get weakPassword => 'weak password';

  @override
  String get passwordMismatch => 'password mismatch';

  @override
  String get emailAddressTaken => 'email address already in use';

  @override
  String get operationNotAllowed => 'operation not allowed, please contact support!';

  @override
  String get accountExistsWithDifferentCredential => 'account already exists with different credential';

  @override
  String get invalidCredential => 'invalid credential';

  @override
  String get invalidVerificationCode => 'invalid verification code';

  @override
  String get invalidVerificationId => 'invalid verification ID';

  @override
  String get requiresRecentLogin => 'requires recent login';

  @override
  String get tooManyRequests => 'too many requests, please try again later';

  @override
  String get missingAndroidPkgName => 'missing Android package name, please contact support!';

  @override
  String get missingContinueUri => 'missing continue URI, please contact support!';

  @override
  String get missingIosBundleId => 'missing iOS bundle ID, please contact support!';

  @override
  String get unauthorizedContinueUri => 'unauthorized continue URI, please contact support!';

  @override
  String get expiredActionCode => 'expired action code';

  @override
  String get invalidActionCode => 'invalid action code';

  @override
  String get invalidContinueUri => 'invalid continue URI';

  @override
  String get userNotFound => 'user not found';

  @override
  String get userDisabled => 'user disabled';

  @override
  String get unknownErrorOccured => 'unknown error occurred';

  @override
  String get emailExplanation => 'Let\'s get started by entering your email address.';

  @override
  String get signUpExplanation => 'Looks like there is no account associated with this email address. Let\'s create one!';

  @override
  String get signInExplanation => 'Looks like there is already an account associated with this email address. Let\'s sign in!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmedPassword => 'Password confirmation';

  @override
  String get signIn => 'Sign in';

  @override
  String get signOut => 'Sign out';

  @override
  String get signUp => 'Sign up';

  @override
  String get next => 'Next';

  @override
  String get previouse => 'Previouse';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get dontYouHaveAccount => 'Don\'t have an account? Click here to create one!';

  @override
  String get doYouHaveAccount => 'Do you have an account? Click here to sign in!';

  @override
  String get insufficientPermissions => 'Insufficient permissions';

  @override
  String get theFollowingPermissionsAreDenied => 'The following permissions are denied';

  @override
  String get theFollowingPermissionsAreRestricted => 'The following permissions are restricted by the operating system. This could be due to parental controls or other restrictions. This part of the app cannot function without having the permission.';

  @override
  String get theFollowingPermissionsArePermanentlyDenied => 'The following permissions are permanently denied. You need to grant them in your phones settings.';

  @override
  String get grantPermissions => 'Grant permissions';

  @override
  String get openSettings => 'Open settings';
}
