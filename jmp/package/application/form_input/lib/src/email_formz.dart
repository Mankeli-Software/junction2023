import 'package:formz/formz.dart';

/// {@template email_formz}
/// Form input for an email input.
/// {@endtemplate}
class EmailFormz extends FormzInput<String, EmailValidationError> {
  /// {@macro email_formz}
  const EmailFormz.pure() : super.pure('');

  /// {@macro email_formz}
  const EmailFormz.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^(?!.*?\.\.)(?!\.)(?!-)(?!.*?--)(\w[\w-_.+]*\w)(@[\w-]+(?!-)\.[\w-]+(\.\w+(\.\w+)?[^.\W])?)$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid
}
