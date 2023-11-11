import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// States a reason why authentication failed
  ///
  /// In en, this message translates to:
  /// **'Authentication failed: {reason}'**
  String authenticationFailure(String reason);

  /// Loading progress in percentages
  ///
  /// In en, this message translates to:
  /// **'Loading - {progress}%'**
  String loadingProgress(Object progress);

  /// Greeting based on email address or name
  ///
  /// In en, this message translates to:
  /// **'Hi,\n{personation}!'**
  String personatedWelcomeText(Object personation);

  /// A message stating that a password reset email has been sent to the given email address
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent to  {email}'**
  String passwordResetSent(Object email);

  /// Greeting for new users
  ///
  /// In en, this message translates to:
  /// **'Welcome, fellow app user!'**
  String get welcomeText;

  /// Suggestion to fix error when attempting an action which requires recent login
  ///
  /// In en, this message translates to:
  /// **'please log out and back in to proceed.'**
  String get logInAgainToProceed;

  /// Error message stating that signing in failed
  ///
  /// In en, this message translates to:
  /// **'signing in failed'**
  String get signingInFailed;

  /// Error message stating that signing up failed
  ///
  /// In en, this message translates to:
  /// **'signing up failed'**
  String get signingUpFailed;

  /// Error message stating that password reset failed
  ///
  /// In en, this message translates to:
  /// **'password reset failed'**
  String get passwordResetFailed;

  /// Error message stating that email update failed
  ///
  /// In en, this message translates to:
  /// **'email update failed'**
  String get emailUpdateFailed;

  /// Error message shown when the given email is not valid
  ///
  /// In en, this message translates to:
  /// **'invalid email'**
  String get invalidEmail;

  /// Error message shown when the given password is not valid
  ///
  /// In en, this message translates to:
  /// **'invalid password'**
  String get invalidPassword;

  /// Error message shown when password is too short
  ///
  /// In en, this message translates to:
  /// **'must be at least 8 characters long.'**
  String get passwordMustBeAtLeast8Characters;

  /// Error message shown when password does not contain a number
  ///
  /// In en, this message translates to:
  /// **'must contain at least one number.'**
  String get passwordMustContainNumber;

  /// Error message shown when password does not contain a capital letter
  ///
  /// In en, this message translates to:
  /// **'must contain at least one capital letter.'**
  String get passwordMustContainCapitalLetter;

  /// Error message shown when password does not contain a lowercase letter
  ///
  /// In en, this message translates to:
  /// **'must contain at least on lowercase letter.'**
  String get passwordMustContainLowercaseLetter;

  /// Error message shown when an action is attempted while unauthenticated
  ///
  /// In en, this message translates to:
  /// **'Cannot complete the action while unauthenticated'**
  String get unauthenticated;

  /// Error message shown when the given password is too weak
  ///
  /// In en, this message translates to:
  /// **'weak password'**
  String get weakPassword;

  /// Error message shown when the given passwords do not match
  ///
  /// In en, this message translates to:
  /// **'password mismatch'**
  String get passwordMismatch;

  /// Error message shown when the given email address is already in use
  ///
  /// In en, this message translates to:
  /// **'email address already in use'**
  String get emailAddressTaken;

  /// Error message shown when the given operation is not allowed (due to account lock etc.)
  ///
  /// In en, this message translates to:
  /// **'operation not allowed, please contact support!'**
  String get operationNotAllowed;

  /// Error message shown when the given account already exists with a different credential (different auth provider)
  ///
  /// In en, this message translates to:
  /// **'account already exists with different credential'**
  String get accountExistsWithDifferentCredential;

  /// Error message shown when the given credential is invalid
  ///
  /// In en, this message translates to:
  /// **'invalid credential'**
  String get invalidCredential;

  /// Error message shown when the given verification code is invalid
  ///
  /// In en, this message translates to:
  /// **'invalid verification code'**
  String get invalidVerificationCode;

  /// Error message shown when the given verification ID is invalid
  ///
  /// In en, this message translates to:
  /// **'invalid verification ID'**
  String get invalidVerificationId;

  /// Error message shown when an action is attempted which requires recent login
  ///
  /// In en, this message translates to:
  /// **'requires recent login'**
  String get requiresRecentLogin;

  /// Error message shown when too many requests are made within a short period of time
  ///
  /// In en, this message translates to:
  /// **'too many requests, please try again later'**
  String get tooManyRequests;

  /// Error message shown when the Android package name is missing (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'missing Android package name, please contact support!'**
  String get missingAndroidPkgName;

  /// Error message shown when the continue URI is missing (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'missing continue URI, please contact support!'**
  String get missingContinueUri;

  /// Error message shown when the iOS bundle ID is missing (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'missing iOS bundle ID, please contact support!'**
  String get missingIosBundleId;

  /// Error message shown when the continue URI is unauthorized (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'unauthorized continue URI, please contact support!'**
  String get unauthorizedContinueUri;

  /// Error message shown when the given action code is expired (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'expired action code'**
  String get expiredActionCode;

  /// Error message shown when the given action code is invalid (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'invalid action code'**
  String get invalidActionCode;

  /// Error message shown when the given continue URI is invalid (related to authentication)
  ///
  /// In en, this message translates to:
  /// **'invalid continue URI'**
  String get invalidContinueUri;

  /// Error message shown when the given user is not found
  ///
  /// In en, this message translates to:
  /// **'user not found'**
  String get userNotFound;

  /// Error message shown when the given user is disabled / restricted
  ///
  /// In en, this message translates to:
  /// **'user disabled'**
  String get userDisabled;

  /// Error message shown when an unknown error occurs
  ///
  /// In en, this message translates to:
  /// **'unknown error occurred'**
  String get unknownErrorOccured;

  /// Call to action description for authentication email input
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started by entering your email address.'**
  String get emailExplanation;

  /// Call to action description for creating a new account
  ///
  /// In en, this message translates to:
  /// **'Looks like there is no account associated with this email address. Let\'s create one!'**
  String get signUpExplanation;

  /// Call to action description for signing in
  ///
  /// In en, this message translates to:
  /// **'Looks like there is already an account associated with this email address. Let\'s sign in!'**
  String get signInExplanation;

  /// Title / Hint text for an email input
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Title / Hint text for a password input
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Title / Hint text for a password confirmation input
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get confirmedPassword;

  /// Call to action text for a sign in button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// Call to action text for a sign out button
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// Call to action text for a sign up button
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Call to action text for a next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Call to action text for a previouse button
  ///
  /// In en, this message translates to:
  /// **'Previouse'**
  String get previouse;

  /// Call to action text for a reset password button
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// Call to action text for creating an account instead of signing in
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Click here to create one!'**
  String get dontYouHaveAccount;

  /// Call to action text for signing in instead of creating an account
  ///
  /// In en, this message translates to:
  /// **'Do you have an account? Click here to sign in!'**
  String get doYouHaveAccount;

  /// Error message shown when the user does not have sufficient permissions
  ///
  /// In en, this message translates to:
  /// **'Insufficient permissions'**
  String get insufficientPermissions;

  /// A text describing some permissions are denied
  ///
  /// In en, this message translates to:
  /// **'The following permissions are denied'**
  String get theFollowingPermissionsAreDenied;

  /// A text describing some permissions are restricted by the OS
  ///
  /// In en, this message translates to:
  /// **'The following permissions are restricted by the operating system. This could be due to parental controls or other restrictions. This part of the app cannot function without having the permission.'**
  String get theFollowingPermissionsAreRestricted;

  /// A text describing some permissions are permanently denied and shall be granted in the settings
  ///
  /// In en, this message translates to:
  /// **'The following permissions are permanently denied. You need to grant them in your phones settings.'**
  String get theFollowingPermissionsArePermanentlyDenied;

  /// A call to action text for granting permissions
  ///
  /// In en, this message translates to:
  /// **'Grant permissions'**
  String get grantPermissions;

  /// A call to action text for opening the settings
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
