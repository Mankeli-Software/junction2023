import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:model/model.dart';

/// {@template user_formz}
/// Form input for a display name
/// {@endtemplate}
class UserFormz extends FormzInput<User, UserValidationError> {
  /// {@macro user_formz}
  const UserFormz.pure() : super.pure(User.empty);

  /// {@macro user_formz}
  const UserFormz.dirty([super.value = User.empty]) : super.dirty();

  @override
  UserValidationError? validator(User value) {
    if (value.isEmpty) return UserValidationError.emptyUser;

    final emailError = EmailFormz.dirty(value.email ?? '').error;

    if (emailError != null) return UserValidationError.invalidEmail;

    if (value.displayName == null || value.displayName!.isEmpty) {
      return UserValidationError.invalidDisplayName;
    }

    return null;
  }
}

/// Validation errors for the [DisplayName] [FormzInput].
enum UserValidationError {
  /// Invalid email
  invalidEmail,

  /// Invalid display name
  invalidDisplayName,

  /// Empty user
  emptyUser,
}
