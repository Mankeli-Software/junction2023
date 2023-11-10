import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';

void main() {
  const validPassword = 'Abcde123!';
  const tooShortPassword = 'asdf';
  const noNumberPassword = 'Abcdefgh!';
  const noCapitalLetterPassword = 'abcdefg1!';
  const noLowercaseLetterPassword = 'ABCDEFG1!';
  group(
    'PasswordFormz',
    () {
      group(
        'constructors',
        () {
          test(
            'super.pure() constructor is called '
            'when PasswordFormz.pure() constructor is used',
            () {
              const password = PasswordFormz.pure();
              expect(password.status, FormzInputStatus.pure);
              expect(Formz.validate([password]), FormzStatus.pure);
            },
          );

          test(
            'super.dirty() constructor is called '
            'when PasswordFormz.dirty() constructor is used',
            () {
              const password = PasswordFormz.dirty();
              expect(password.status, FormzInputStatus.invalid);
              expect(Formz.validate([password]), FormzStatus.invalid);
            },
          );
        },
      );

      group(
        'valid passwords',
        () {
          test(
            'validator returns null '
            'when valid single valid password is provided',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: validPassword,
                  requireConfirmation: false,
                ),
              );
              expect(password.error, null);
            },
          );

          test(
            'validator returns null '
            'when two matching valid passwords are provided',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: validPassword,
                  second: validPassword,
                ),
              );
              expect(password.error, null);
            },
          );
        },
      );

      group(
        'invalid passwords',
        () {
          test(
            'validator returns PasswordValidationError.mustBeAtLeast8Characters '
            'when password is too short',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: tooShortPassword,
                  requireConfirmation: false,
                ),
              );
              expect(
                password.error,
                PasswordValidationError.mustBeAtLeast8Characters,
              );
            },
          );
          test(
            'validator returns PasswordValidationError.mustContainNumber '
            'when password is does not contain a number',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: noNumberPassword,
                  requireConfirmation: false,
                ),
              );
              expect(
                password.error,
                PasswordValidationError.mustContainNumber,
              );
            },
          );

          test(
            'validator returns PasswordValidationError.mustContainCapitalLetter '
            'when password is does not contain a capital letter',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: noCapitalLetterPassword,
                  requireConfirmation: false,
                ),
              );
              expect(
                password.error,
                PasswordValidationError.mustContainCapitalLetter,
              );
            },
          );

          test(
            'validator returns PasswordValidationError.mustContainLowercaseLetter '
            'when password is does not contain a lowercase letter',
            () {
              const password = PasswordFormz.dirty(
                Password(
                  first: noLowercaseLetterPassword,
                  requireConfirmation: false,
                ),
              );
              expect(
                password.error,
                PasswordValidationError.mustContainLowercaseLetter,
              );
            },
          );
        },
      );
    },
  );
}
