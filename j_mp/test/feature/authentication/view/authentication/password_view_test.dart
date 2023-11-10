import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:j_mp/feature/authentication/cubit/authentication/authentication.dart';
import 'package:j_mp/feature/authentication/view/authentication/authentication.dart';
import 'package:j_mp/utility/utility.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

class MockPassword extends Mock implements PasswordFormz {}

void main() async {
  const validPassword = 'testP@ssw0rd1';

  final localizations = await AppLocalizations.delegate.load(
    const Locale('en', ''),
  );

  late AuthenticationCubit authenticationCubit;
  late MockPassword password;

  late Widget Function(Widget) bootstrap;

  group(
    'PasswordInput',
    () {
      setUp(
        () {
          TestHelper.setUp();
          authenticationCubit = MockAuthenticationCubit();
          password = MockPassword();

          bootstrap = (child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<AuthenticationCubit>.value(
                  value: authenticationCubit,
                ),
              ],
              child: TestHelper.bootstrap(child),
            );
          };

          when(
            () => authenticationCubit.state,
          ).thenReturn(
            const AuthenticationState(
              type: AuthenticationType.signUp,
            ),
          );
          when(
            () => authenticationCubit.backToEmail(),
          ).thenAnswer(
            (_) {
              return;
            },
          );
          when(
            () => authenticationCubit.signIn(),
          ).thenAnswer(
            (_) async {
              return;
            },
          );
          when(
            () => authenticationCubit.signUp(),
          ).thenAnswer(
            (_) async {
              return;
            },
          );
          when(
            () => authenticationCubit.updateConfirmedPassword(
              any<String>(),
            ),
          ).thenAnswer(
            (_) {
              return;
            },
          );
          when(
            () => authenticationCubit.updatePassword(
              any<String>(),
            ),
          ).thenAnswer(
            (_) {
              return;
            },
          );
        },
      );

      group(
        'calls',
        () {
          testWidgets(
            'updatePassword '
            'when password is updated',
            (tester) async {
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );
              await tester.enterText(
                find.byKey(PasswordView.kPasswordInputKey),
                validPassword,
              );
              verify(
                () => authenticationCubit.updatePassword(validPassword),
              ).called(1);
            },
          );
          testWidgets(
            'updateConfirmedPassword '
            'when confirmed password is updated',
            (tester) async {
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );
              await tester.enterText(
                find.byKey(PasswordView.kConfirmedPasswordInputKey),
                validPassword,
              );
              verify(
                () =>
                    authenticationCubit.updateConfirmedPassword(validPassword),
              ).called(1);
            },
          );

          testWidgets(
            'backToEmail '
            'when back button is pressed',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              await tester.tap(
                find.byKey(PasswordView.kPreviouseButtonKey),
              );
              await tester.pumpAndSettle();
              verify(
                () => authenticationCubit.backToEmail(),
              ).called(1);
            },
          );

          testWidgets(
            'signUp '
            'when sign up is pressed',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signUp,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              await tester.tap(
                find.byKey(PasswordView.kAuthenticateButtonKey),
              );
              verify(
                () => authenticationCubit.signUp(),
              ).called(1);
            },
          );

          testWidgets(
            'signIn '
            'when sign in is pressed',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              await tester.tap(
                find.byKey(PasswordView.kAuthenticateButtonKey),
              );
              verify(
                () => authenticationCubit.signIn(),
              ).called(1);
            },
          );
        },
      );

      group(
        'does not call',
        () {
          testWidgets(
            'authentication methods '
            'when passwords are invalid',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                  passwordStatus: FormzStatus.invalid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );
              await tester.tap(
                find.byKey(PasswordView.kAuthenticateButtonKey),
              );
              verifyNever(
                () => authenticationCubit.signIn(),
              );
            },
          );

          testWidgets(
            'authentication methods '
            'when submission is in progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  passwordStatus: FormzStatus.submissionInProgress,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              await tester.tap(
                find.byKey(PasswordView.kAuthenticateButtonKey),
              );
              verifyNever(
                () => authenticationCubit.signUp(),
              );
            },
          );

          testWidgets(
            'backToEmail '
            'when submission is in progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  passwordStatus: FormzStatus.submissionInProgress,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              await tester.tap(
                find.byKey(PasswordView.kPreviouseButtonKey),
              );
              verifyNever(
                () => authenticationCubit.backToEmail(),
              );
            },
          );
        },
      );

      group(
        'renders',
        () {
          testWidgets(
            'invalid password error text '
            'when password is invalid',
            (tester) async {
              when(() => password.error).thenAnswer(
                (_) => PasswordValidationError.mustBeAtLeast8Characters,
              );
              when(() => authenticationCubit.state).thenReturn(
                AuthenticationState(
                  password: password,
                  passwordStatus: FormzStatus.invalid,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.passwordMustBeAtLeast8Characters,
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'invalid password error text '
            'when passwords dont match',
            (tester) async {
              when(() => password.error).thenAnswer(
                (_) => PasswordValidationError.mustEqualConfirmation,
              );
              when(() => authenticationCubit.state).thenReturn(
                AuthenticationState(
                  type: AuthenticationType.signUp,
                  password: password,
                  passwordStatus: FormzStatus.invalid,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.passwordMismatch,
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'confirmedPassword and password input fields '
            'when type is AuthenticationType.signUp',
            (tester) async {
              when(() => password.error).thenAnswer(
                (_) => PasswordValidationError.mustEqualConfirmation,
              );
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signUp,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.byKey(PasswordView.kConfirmedPasswordInputKey),
                findsOneWidget,
              );

              expect(
                find.byKey(PasswordView.kPasswordInputKey),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'password input field '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => password.error).thenAnswer(
                (_) => PasswordValidationError.mustEqualConfirmation,
              );
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.byKey(PasswordView.kPasswordInputKey),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'signIn button '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );
              expect(
                find.text(
                  localizations.signIn,
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'signUp button '
            'when type is AuthenticationType.signUp',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signUp,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.signUp,
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'signIn button '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                  passwordStatus: FormzStatus.valid,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.signIn,
                ),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'previouse button '
            'always ',
            (tester) async {
              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.previouse,
                ),
                findsOneWidget,
              );
            },
          );
        },
      );

      group(
        'does not render',
        () {
          testWidgets(
            'invalid password error text '
            'when password is valid',
            (tester) async {
              when(() => password.error).thenAnswer((_) => null);
              when(() => authenticationCubit.state).thenReturn(
                AuthenticationState(
                  password: password,
                  passwordStatus: FormzStatus.valid,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.passwordMustBeAtLeast8Characters,
                ),
                findsNothing,
              );
            },
          );

          testWidgets(
            'invalid password error text '
            'when passwords do match',
            (tester) async {
              when(() => password.error).thenAnswer((_) => null);
              when(() => authenticationCubit.state).thenReturn(
                AuthenticationState(
                  password: password,
                  passwordStatus: FormzStatus.valid,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );

              expect(
                find.text(
                  localizations.passwordMismatch,
                ),
                findsNothing,
              );
            },
          );

          testWidgets(
            'confirmedPassword input field '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => password.error).thenAnswer(
                (_) => PasswordValidationError.mustEqualConfirmation,
              );
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const PasswordView(),
                ),
              );
              expect(
                find.byKey(PasswordView.kConfirmedPasswordInputKey),
                findsNothing,
              );
            },
          );
        },
      );
    },
  );
}
