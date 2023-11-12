// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:jmp/feature/authentication/cubit/authentication/authentication.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';

import '../../../../test_helper.dart';

void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = EmailFormz.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = EmailFormz.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = PasswordFormz.dirty(
    Password(
      first: invalidPasswordString,
      requireConfirmation: false,
    ),
  );

  const validPasswordString = 'T0pS3cret1234';
  const validPassword = PasswordFormz.dirty(
    Password(
      first: validPasswordString,
      requireConfirmation: false,
    ),
  );

  const invalidConfirmedPasswordString = 'invalid';

  const validConfirmedPasswordString = validPasswordString;

  group(
    'AuthenticationCubit',
    () {
      late AuthenticationCubit authenticationCubit;
      setUp(
        () {
          TestHelper.setUp();
          registerFallbackValue('fallbackstring');

          authenticationCubit = AuthenticationCubit(
            authenticationRepository: TestHelper.authenticationRepository,
          );
          when(
            () => TestHelper.authenticationRepository.authChanges,
          ).thenAnswer(
            (c) => const Stream.empty(),
          );
          when(
            () => TestHelper.authenticationRepository.signIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer(
            (_) async {
              return;
            },
          );

          when(
            () => TestHelper.authenticationRepository.signUp(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer(
            (_) async {
              return;
            },
          );
        },
      );

      test(
        'initial state is AuthenticationState',
        () {
          expect(
            AuthenticationCubit(
              authenticationRepository: TestHelper.authenticationRepository,
            ).state,
            const AuthenticationState(),
          );
        },
      );

      group(
        'authChanges',
        () {
          late AuthenticationRepository authRepo;
          final controller = StreamController<User>();
          late AuthenticationCubit authChangeCubit;
          setUp(
            () {
              authRepo = MockAuthenticationRepository();
              when(
                () => authRepo.authChanges,
              ).thenAnswer((c) => controller.stream);

              authChangeCubit = AuthenticationCubit(
                authenticationRepository: authRepo,
              );
            },
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with correct parameters '
            'when called',
            build: () => authChangeCubit..initialize(),
            seed: () => const AuthenticationState(
              email: validEmail,
              emailStatus: FormzStatus.valid,
              password: validPassword,
              passwordStatus: FormzStatus.valid,
              type: AuthenticationType.signUp,
            ),
            act: (cubit) {
              controller
                ..add(User.empty)
                ..add(
                  const User(id: '1', email: 'test@test.com'),
                );
            },
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
                password: validPassword,
                passwordStatus: FormzStatus.valid,
                type: AuthenticationType.authenticated,
              ),
            ],
          );
        },
      );

      group(
        'backToEmail',
        () {
          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with correct parameters '
            'when called',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              email: validEmail,
              emailStatus: FormzStatus.valid,
              password: validPassword,
              passwordStatus: FormzStatus.valid,
              type: AuthenticationType.signUp,
            ),
            act: (cubit) => cubit.backToEmail(),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
                password: PasswordFormz.pure(),
                passwordStatus: FormzStatus.pure,
                type: AuthenticationType.unknown,
              ),
            ],
          );
        },
      );

      group(
        'updateEmail',
        () {
          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted emailStatus is FormzStatus.invalid '
            'when email is invalid',
            build: () => authenticationCubit,
            act: (cubit) => cubit.updateEmail(invalidEmailString),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                email: invalidEmail,
                emailStatus: FormzStatus.invalid,
              ),
            ],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted emailStatus is FormzStatus.valid '
            'when email is valid',
            build: () => authenticationCubit,
            act: (cubit) => cubit.updateEmail(validEmailString),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
              ),
            ],
          );
        },
      );

      group(
        'updatePassword',
        () {
          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted passwordStatus is FormzStatus.invalid '
            'when password is invalid',
            build: () => authenticationCubit,
            act: (cubit) => cubit.updatePassword(invalidPasswordString),
            seed: () => const AuthenticationState(),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                password: invalidPassword,
                passwordStatus: FormzStatus.invalid,
              ),
            ],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted passwordStatus is FormzStatus.valid '
            'when password is valid',
            build: () => authenticationCubit,
            act: (cubit) => cubit.updatePassword(validPasswordString),
            seed: () => const AuthenticationState(),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                password: validPassword,
                passwordStatus: FormzStatus.valid,
              ),
            ],
          );
        },
      );

      group(
        'updateConfirmedPassword',
        () {
          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted passwordStatus is FormzStatus.invalid '
            'when confirmedPassword is invalid',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              password: validPassword,
              type: AuthenticationType.signUp,
            ),
            act: (cubit) =>
                cubit.updateConfirmedPassword(invalidConfirmedPasswordString),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                passwordStatus: FormzStatus.invalid,
                password: validPassword,
                type: AuthenticationType.signUp,
              ),
            ],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emitted passwordStatus is FormzStatus.valid '
            'when confirmedPassword is valid',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              password: validPassword,
              type: AuthenticationType.signUp,
            ),
            act: (cubit) =>
                cubit.updateConfirmedPassword(validConfirmedPasswordString),
            expect: () => const <AuthenticationState>[
              AuthenticationState(
                passwordStatus: FormzStatus.valid,
                password: validPassword,
                type: AuthenticationType.signUp,
              ),
            ],
          );
        },
      );

      group(
        'checkForEmail',
        () {
          late AuthenticationState initialState;

          setUp(
            () {
              initialState = const AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
              );
            },
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.emailStatus is FormzStatus.submissionInProgress',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              emailStatus: FormzStatus.submissionInProgress,
            ),
            act: (cubit) => cubit.checkForEmail(),
            expect: () => const <AuthenticationState>[],
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.emailStatus is FormzStatus.invalid',
            build: () => authenticationCubit,
            seed: () =>
                const AuthenticationState(emailStatus: FormzStatus.invalid),
            act: (cubit) => cubit.checkForEmail(),
            expect: () => const <AuthenticationState>[],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with AuthenticationType.signIn '
            'when doesUserExist returns true',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.doesUserExist(
                  any<String>(),
                ),
              ).thenAnswer((_) async => true);
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.checkForEmail(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                emailStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                emailStatus: FormzStatus.submissionSuccess,
                type: AuthenticationType.signIn,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.doesUserExist(
                any<String>(),
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with AuthenticationType.signUp '
            'when doesUserExist returns false',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.doesUserExist(
                  any<String>(),
                ),
              ).thenAnswer((_) async => false);
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.checkForEmail(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                emailStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                emailStatus: FormzStatus.submissionSuccess,
                type: AuthenticationType.signUp,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.doesUserExist(
                any<String>(),
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with emailStatus FormzStatus.submissionFailure '
            'when doesUserExist throws EmailLookupFailure',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.doesUserExist(
                  any<String>(),
                ),
              ).thenThrow(
                EmailLookupFailure.fromCode(kInvalidEmailError),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.checkForEmail(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                emailStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                emailStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.invalidEmail,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.doesUserExist(
                any<String>(),
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with emailStatus FormzStatus.submissionFailure '
            'when doesUserExist throws unknown error',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.doesUserExist(
                  any<String>(),
                ),
              ).thenThrow(
                Exception(),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.checkForEmail(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                emailStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                emailStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.unknown,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.doesUserExist(
                any<String>(),
              ),
            ).called(1),
          );
        },
      );

      group(
        'signIn',
        () {
          late AuthenticationState initialState;

          setUp(
            () {
              initialState = const AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
                password: validPassword,
                passwordStatus: FormzStatus.valid,
              );
            },
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.passwordStatus is FormzStatus.submissionInProgress',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              passwordStatus: FormzStatus.submissionInProgress,
            ),
            act: (cubit) => cubit.signIn(),
            expect: () => const <AuthenticationState>[],
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.passwordStatus is FormzStatus.invalid',
            build: () => authenticationCubit,
            seed: () =>
                const AuthenticationState(passwordStatus: FormzStatus.invalid),
            act: (cubit) => cubit.signIn(),
            expect: () => const <AuthenticationState>[],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when signIn is called on authenticationRepository and it does not throw',
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signIn(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signIn(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with passwordStatus FormzStatus.submissionFailure '
            'when signIn throws SignInWithEmailAndPassword',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.signIn(
                  email: validEmailString,
                  password: validPasswordString,
                ),
              ).thenThrow(
                SignInWithEmailAndPasswordFailure.fromCode(kInvalidEmailError),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signIn(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.invalidEmail,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signIn(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with passwordStatus FormzStatus.submissionFailure '
            'when signIn throws unknown error',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.signIn(
                  email: validEmailString,
                  password: validPasswordString,
                ),
              ).thenThrow(
                Exception(),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signIn(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.unknown,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signIn(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );
        },
      );

      group(
        'signUp',
        () {
          late AuthenticationState initialState;

          setUp(
            () {
              initialState = const AuthenticationState(
                email: validEmail,
                emailStatus: FormzStatus.valid,
                password: validPassword,
                passwordStatus: FormzStatus.valid,
              );
            },
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.passwordStatus is FormzStatus.submissionInProgress',
            build: () => authenticationCubit,
            seed: () => const AuthenticationState(
              passwordStatus: FormzStatus.submissionInProgress,
            ),
            act: (cubit) => cubit.signUp(),
            expect: () => const <AuthenticationState>[],
          );
          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when state.passwordStatus is FormzStatus.invalid',
            build: () => authenticationCubit,
            seed: () =>
                const AuthenticationState(passwordStatus: FormzStatus.invalid),
            act: (cubit) => cubit.signUp(),
            expect: () => const <AuthenticationState>[],
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'does nothing '
            'when signUp is called on authenticationRepository and it does not throw',
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signUp(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signUp(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with passwordStatus FormzStatus.submissionFailure '
            'when signUp throws SignInWithEmailAndPassword',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.signUp(
                  email: validEmailString,
                  password: validPasswordString,
                ),
              ).thenThrow(
                SignUpWithEmailAndPasswordFailure.fromCode(kInvalidEmailError),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signUp(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.invalidEmail,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signUp(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );

          blocTest<AuthenticationCubit, AuthenticationState>(
            'emits state with passwordStatus FormzStatus.submissionFailure '
            'when signUp throws unknown error',
            setUp: () {
              when(
                () => TestHelper.authenticationRepository.signUp(
                  email: validEmailString,
                  password: validPasswordString,
                ),
              ).thenThrow(
                Exception(),
              );
            },
            build: () => authenticationCubit,
            seed: () => initialState,
            act: (cubit) => cubit.signUp(),
            expect: () => <AuthenticationState>[
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionInProgress,
              ),
              initialState.copyWith(
                passwordStatus: FormzStatus.submissionFailure,
                failureStatus: AuthenticationFailureStatus.unknown,
              ),
            ],
            verify: (_) => verify(
              () => TestHelper.authenticationRepository.signUp(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1),
          );
        },
      );
    },
  );
}
