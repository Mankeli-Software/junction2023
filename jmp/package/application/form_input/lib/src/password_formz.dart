import 'package:formz/formz.dart';

/// {@template password_formz}
/// Form input for an password input.
/// {@endtemplate}
class PasswordFormz extends FormzInput<Password, PasswordValidationError> {
  /// {@macro password_formz}
  const PasswordFormz.pure() : super.pure(const Password());

  /// {@macro password_formz}
  const PasswordFormz.dirty([super.value = const Password()]) : super.dirty();

  @override
  PasswordValidationError? validator(Password value) {
    if (value.first == null) {
      return PasswordValidationError.mustBeAtLeast8Characters;
    }

    if (value.requireConfirmation && value.first != value.second) {
      return PasswordValidationError.mustEqualConfirmation;
    }

    final input = value.first!;

    if (!RegExp(r'^.{8,}$').hasMatch(input)) {
      return PasswordValidationError.mustBeAtLeast8Characters;
    }

    if (!RegExp('(?=.*[0-9])').hasMatch(input)) {
      return PasswordValidationError.mustContainNumber;
    }

    if (!RegExp('(?=.*[A-Z])').hasMatch(input)) {
      return PasswordValidationError.mustContainCapitalLetter;
    }

    if (!RegExp('(?=.*[a-z])').hasMatch(input)) {
      return PasswordValidationError.mustContainLowercaseLetter;
    }

    return null;
  }
}

/// {@template password_validation_error}
/// Validation errors for the [Password] [FormzInput].
/// {@endtemplate}
enum PasswordValidationError {
  /// {@macro password_validation_error}
  mustBeAtLeast8Characters,

  /// {@macro password_validation_error}
  mustContainNumber,

  /// {@macro password_validation_error}
  mustContainCapitalLetter,

  /// {@macro password_validation_error}
  mustContainLowercaseLetter,

  /// {@macro password_validation_error}
  mustEqualConfirmation,
}

/// {@template password}
/// A simple password class.
/// {@endtemplate}
class Password {
  /// {@macro password}
  const Password({
    this.first,
    this.second,
    this.requireConfirmation = true,
  });

  /// The first password
  final String? first;

  /// The second password (confirmation)
  final String? second;

  /// Whether the password should be confirmed (first equals second)
  final bool requireConfirmation;

  /// Returns a new instance of this class
  Password copyWith({
    String? first,
    String? second,
    bool? requireConfirmation,
  }) {
    return Password(
      first: first ?? this.first,
      second: second ?? this.second,
      requireConfirmation: requireConfirmation ?? this.requireConfirmation,
    );
  }
}
