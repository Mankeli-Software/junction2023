part of 'authentication.dart';

/// {@template authentication_state}
/// This state is used by `AuthenticationCubit` to manage the state of `AuthenticationPage`.
/// It specifies, whether `AuthenticationPage` shall show sign in screen, or sign up screen. Also it handles
/// when the loading indicator shall be shown and when error messages shall be shown for invalid passwords / emails.
/// {@endtemplate}
@freezed
class AuthenticationState with _$AuthenticationState {
  /// {@macro authentication_state}
  const factory AuthenticationState({
    /// {@macro authentication_type}
    @Default(AuthenticationType.unknown)
        AuthenticationType type,

    /// A formz input for the email address
    @Default(EmailFormz.pure())
        EmailFormz email,

    /// A formz input for the password
    @Default(PasswordFormz.pure())
        PasswordFormz password,

    /// A formz status for the email
    @Default(FormzStatus.pure)
        FormzStatus emailStatus,

    /// A formz status for the password(s)
    @Default(FormzStatus.pure)
        FormzStatus passwordStatus,

    /// A formz status for the password reset
    @Default(FormzStatus.valid)
        FormzStatus passwordResetStatus,

    /// The status of [AuthenticationRepository]s failures.
    @Default(AuthenticationFailureStatus.unknown)
        AuthenticationFailureStatus failureStatus,
  }) = _AuthenticationState;
}

/// {@template authentication_type}
/// This enum specifies which screen shall be shown in `AuthenticationPage`.
/// The flow is the following:
///  1. User enters email -> [AuthenticationType.unknown]
///  2. If the email is already associated with an account, the user is asked for the existing password (sign in) -> [AuthenticationType.signIn]
///  3. If the email is not associated with an account, the user is asked to create a password (sign up) -> [AuthenticationType.signUp]
/// {@endtemplate}
enum AuthenticationType {
  /// {@macro authentication_type}
  signIn,

  /// {@macro authentication_type}
  signUp,

  /// {@macro authentication_type}
  unknown,

  /// {@macro authentication_type}
  authenticated
}
