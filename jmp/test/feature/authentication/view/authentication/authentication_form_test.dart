import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:jmp/feature/authentication/cubit/authentication/authentication.dart';
import 'package:jmp/feature/authentication/view/authentication/authentication.dart';
import 'package:jmp/utility/utility.dart';
import 'package:jmp/widget/widget.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

void main() async {
  late AuthenticationCubit authenticationCubit;
  late Widget Function(Widget) bootstrap;

  final localizations = await AppLocalizations.delegate.load(
    const Locale('en'),
  );

  group(
    'AuthenticationForm',
    () {
      setUp(
        () {
          TestHelper.setUp();
          authenticationCubit = MockAuthenticationCubit();

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

          when(() => TestHelper.router.pop(true)).thenAnswer((_) async => true);
          when(() => authenticationCubit.state).thenReturn(
            const AuthenticationState(),
          );
        },
      );

      group(
        'renders',
        () {
          testWidgets(
            'EmailInput '
            'when type is AuthenticationType.unknown',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(EmailView),
                findsOneWidget,
              );
            },
          );
          testWidgets(
            'PasswordInput '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(PasswordView),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'PasswordInput '
            'when type is AuthenticationType.signUp',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signUp,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );
              expect(
                find.byType(PasswordView),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'CircularProgress '
            'when email input submission is in progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  emailStatus: FormzStatus.submissionInProgress,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(CircularProgress),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'CircularProgress '
            'when password input submission is in progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  passwordStatus: FormzStatus.submissionInProgress,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(CircularProgress),
                findsOneWidget,
              );
            },
          );

          testWidgets(
            'authentication error text '
            'when error occurs',
            (tester) async {
              whenListen(
                authenticationCubit,
                Stream.fromIterable([
                  const AuthenticationState(),
                  const AuthenticationState(
                    emailStatus: FormzStatus.submissionFailure,
                    failureStatus:
                        AuthenticationFailureStatus.emailAlreadyInUse,
                  ),
                ]),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              await tester.pumpAndSettle();

              expect(
                find.text(
                  localizations.emailAddressTaken,
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
            'EmailInput '
            'when type is AuthenticationType.signIn',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signIn,
                ),
              );
              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );
              expect(
                find.byType(EmailView),
                findsNothing,
              );
            },
          );

          testWidgets(
            'EmailInput '
            'when type is AuthenticationType.signUp',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(
                  type: AuthenticationType.signUp,
                ),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(EmailView),
                findsNothing,
              );
            },
          );
          testWidgets(
            'PasswordInput '
            'when type is AuthenticationType.unknown',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );
              expect(
                find.byType(PasswordView),
                findsNothing,
              );
            },
          );

          testWidgets(
            'CircularProgress '
            'when email input submission is not progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(CircularProgress),
                findsNothing,
              );
            },
          );

          testWidgets(
            'CircularProgress '
            'when password input submission is not in progress',
            (tester) async {
              when(() => authenticationCubit.state).thenReturn(
                const AuthenticationState(),
              );

              await tester.pumpWidget(
                bootstrap(
                  const AuthenticationForm(),
                ),
              );

              expect(
                find.byType(CircularProgress),
                findsNothing,
              );
            },
          );
        },
      );
    },
  );
}
