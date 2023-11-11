// ignore_for_file: avoid_redundant_argument_values

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:jmp/feature/authentication/cubit/authentication/authentication.dart';

void main() {
  group('AuthenticationState', () {
    test('support value equality', () {
      expect(const AuthenticationState(), const AuthenticationState());
    });

    test('email, password and confirmedPassword default to pure', () {
      expect(
        const AuthenticationState(),
        const AuthenticationState(
          password: PasswordFormz.pure(),
          email: EmailFormz.pure(),
        ),
      );
    });

    test('emailStatus and passwordStatus default to FormzStatus.pure', () {
      expect(
        const AuthenticationState(),
        const AuthenticationState(
          emailStatus: FormzStatus.pure,
          passwordStatus: FormzStatus.pure,
        ),
      );
    });

    test('failureStatus defaults to AuthenticationFailureStatus.unknown', () {
      expect(
        const AuthenticationState(),
        const AuthenticationState(
          failureStatus: AuthenticationFailureStatus.unknown,
        ),
      );
    });

    test('type defaults to AuthenticationType.unknown', () {
      expect(
        const AuthenticationState(),
        const AuthenticationState(
          type: AuthenticationType.unknown,
        ),
      );
    });

    test(
      'copyWith returns the same object '
      'when no parameters are passed',
      () {
        expect(
          const AuthenticationState().copyWith(),
          const AuthenticationState(),
        );
      },
    );
  });
}
