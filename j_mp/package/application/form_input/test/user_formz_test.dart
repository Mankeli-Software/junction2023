import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:model/model.dart';

void main() {
  group(
    'UserFormz',
    () {
      group(
        'constructors',
        () {
          test(
            'super.pure() constructor is called '
            'when UserFormz.pure() constructor is used',
            () {
              const email = UserFormz.pure();
              expect(email.status, FormzInputStatus.pure);
              expect(Formz.validate([email]), FormzStatus.pure);
            },
          );

          test(
            'super.dirty() constructor is called '
            'when UserFormz.dirty() constructor is used',
            () {
              const email = UserFormz.dirty();
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
            'when valid single valid user is provided',
            () {
              const user = UserFormz.dirty(
                User(
                  id: 'asdf',
                  email: 'test@test.com',
                  displayName: 'Pekka',
                ),
              );
              expect(user.error, null);
            },
          );
        },
      );

      group(
        'invalid users',
        () {
          test(
            'validator returns UserValidationError.invalidEmail '
            'when email is not valid',
            () {
              const user = UserFormz.dirty(
                User(
                  id: 'asdf',
                  email: 'test@test',
                  displayName: 'Pekka',
                ),
              );
              expect(
                user.error,
                UserValidationError.invalidEmail,
              );
            },
          );

          test(
            'validator returns UserValidationError.invalidDisplayName '
            'when display name is not valid',
            () {
              const user = UserFormz.dirty(
                User(
                  id: 'asdf',
                  email: 'test@test',
                ),
              );
              expect(
                user.error,
                UserValidationError.invalidDisplayName,
              );
            },
          );

          test(
            'validator returns UserValidationError.emptyUser '
            'when user is empty',
            () {
              const user = UserFormz.dirty();
              expect(
                user.error,
                UserValidationError.emptyUser,
              );
            },
          );
        },
      );
    },
  );
}
