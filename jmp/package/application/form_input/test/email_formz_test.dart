import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';

void main() {
  group(
    'EmailFormz',
    () {
      group(
        'constructors',
        () {
          test(
            'super.pure() constructor is called '
            'when EmailFormz.pure() constructor is used',
            () {
              const email = EmailFormz.pure();
              expect(email.status, FormzInputStatus.pure);
              expect(Formz.validate([email]), FormzStatus.pure);
            },
          );

          test(
            'super.dirty() constructor is called '
            'when EmailFormz.dirty() constructor is used',
            () {
              const email = EmailFormz.dirty();
              expect(email.status, FormzInputStatus.invalid);
              expect(Formz.validate([email]), FormzStatus.invalid);
            },
          );
        },
      );

      group(
        'valid emails',
        () {
          test(
            'validator returns null '
            'when valid email (with a-z) is provided',
            () {
              const email = EmailFormz.dirty('test@test.com');
              expect(email.error, null);
            },
          );

          test(
            'validator returns null '
            'when valid email (with double domain) is provided',
            () {
              const email = EmailFormz.dirty('test@test.fi.org');
              expect(email.error, null);
            },
          );

          test(
            'validator returns null '
            'when valid email (with numbers) is provided',
            () {
              const email = EmailFormz.dirty('123te123st123@test.com');
              expect(email.error, null);
            },
          );

          test(
            'validator returns null '
            'when valid email (with gmail plus) is provided',
            () {
              const email = EmailFormz.dirty('test+test@test.com');
              expect(email.error, null);
            },
          );

          test(
            'validator returns null '
            'when valid email (with underscores) is provided',
            () {
              const email = EmailFormz.dirty('__te__st__@test.com');
              expect(email.error, null);
            },
          );

          test(
            'validator returns null '
            'when valid email (with -) is provided',
            () {
              const email = EmailFormz.dirty('tes-t@te-st.com');
              expect(email.error, null);
            },
          );
          test(
            'validator returns null '
            'when valid email (with .) is provided',
            () {
              const email = EmailFormz.dirty('tes.t@test.com');
              expect(email.error, null);
            },
          );
        },
      );

      group(
        'invalid emails',
        () {
          test(
            'validator returns EmailValidationError.invalid '
            'when there is no @ in the email',
            () {
              const email = EmailFormz.dirty('testtest.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when when there is no domain',
            () {
              const email = EmailFormz.dirty('test@');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is no prefix',
            () {
              const email = EmailFormz.dirty('@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when prefix starts with .',
            () {
              const email = EmailFormz.dirty('.test@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when prefix starts with -',
            () {
              const email = EmailFormz.dirty('-test@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when prefix ends with -',
            () {
              const email = EmailFormz.dirty('test-@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when prefix ends with .',
            () {
              const email = EmailFormz.dirty('test.@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when prefix contains double .',
            () {
              const email = EmailFormz.dirty('te..st@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when domain contains double .',
            () {
              const email = EmailFormz.dirty('te.st@test..com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is forbidden special character in prefix',
            () {
              const email = EmailFormz.dirty('tes#t@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is forbidden special character in domain',
            () {
              const email = EmailFormz.dirty('test@tes!.com');
              expect(
                email.error,
                EmailValidationError.invalid,
              );
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is invalid gmail plus syntax',
            () {
              const email = EmailFormz.dirty('test+@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is invalid gmail plus syntax',
            () {
              const email = EmailFormz.dirty('+test@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is double @',
            () {
              const email = EmailFormz.dirty('test@@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there are spaces in prefix',
            () {
              const email = EmailFormz.dirty('tes t@test.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there are spaces in domain',
            () {
              const email = EmailFormz.dirty('test@tes t.com');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is no ending in domain',
            () {
              const email = EmailFormz.dirty('test@test.');
              expect(email.error, EmailValidationError.invalid);
            },
          );

          test(
            'validator returns EmailValidationError.invalid '
            'when there is no ending in domain',
            () {
              const email = EmailFormz.dirty('test@test');
              expect(email.error, EmailValidationError.invalid);
            },
          );
        },
      );
    },
  );
}
