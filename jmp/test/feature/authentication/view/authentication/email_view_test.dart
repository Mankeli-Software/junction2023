// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:jmp/feature/authentication/cubit/authentication/authentication.dart';
import 'package:jmp/feature/authentication/view/authentication/authentication.dart';
import 'package:jmp/utility/utility.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helper.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

class MockEmail extends Mock implements EmailFormz {}

void main() async {
  const validEmail = 'test@test.com';

  final localizations =
      await AppLocalizations.delegate.load(const Locale('en', ''));

  late AuthenticationCubit authenticationCubit;
  late EmailFormz email;
  late Widget Function(Widget) bootstrap;

  setUp(() {
    TestHelper.setUp();
    authenticationCubit = MockAuthenticationCubit();
    email = MockEmail();

    bootstrap = (child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationCubit>.value(value: authenticationCubit),
        ],
        child: TestHelper.bootstrap(child),
      );
    };

    when(() => authenticationCubit.state).thenReturn(
      const AuthenticationState(
        type: AuthenticationType.unknown,
      ),
    );
    when(() => authenticationCubit.updateEmail(any<String>())).thenAnswer((_) {
      return;
    });
    when(() => authenticationCubit.checkForEmail()).thenAnswer((_) async {
      return;
    });
  });

  group('EmailInput', () {
    group('calls', () {
      testWidgets(
        'updateEmail '
        'when email is updated',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );
          await tester.enterText(
            find.byKey(EmailView.kEmailInputKey),
            validEmail,
          );
          verify(() => authenticationCubit.updateEmail(validEmail)).called(1);
        },
      );

      testWidgets(
        'checkForEmail '
        'when next button is pressed',
        (tester) async {
          when(() => authenticationCubit.state).thenReturn(
            const AuthenticationState(
              emailStatus: FormzStatus.valid,
            ),
          );
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );

          await tester.tap(find.byKey(EmailView.kNextButtonKey));
          await tester.pumpAndSettle();
          verify(() => authenticationCubit.checkForEmail()).called(1);
        },
      );
    });

    group('does not call', () {
      testWidgets(
        'checkForEmail  '
        'when email is invalid',
        (tester) async {
          when(() => authenticationCubit.state).thenReturn(
            const AuthenticationState(
              emailStatus: FormzStatus.invalid,
            ),
          );
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );

          await tester.tap(find.byKey(EmailView.kNextButtonKey));
          verifyNever(() => authenticationCubit.checkForEmail());
        },
      );

      testWidgets(
        'checkForEmail '
        'when submission is in progress',
        (tester) async {
          when(() => authenticationCubit.state).thenReturn(
            const AuthenticationState(
              emailStatus: FormzStatus.submissionInProgress,
            ),
          );
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );

          await tester.tap(find.byKey(EmailView.kNextButtonKey));
          verifyNever(() => authenticationCubit.checkForEmail());
        },
      );
    });

    group('renders', () {
      testWidgets(
        'invalid email error text '
        'when email is invalid',
        (tester) async {
          // We do use it.
          // ignore: unused_local_variable

          when(() => email.error)
              .thenAnswer((_) => EmailValidationError.invalid);
          when(() => authenticationCubit.state).thenReturn(
            AuthenticationState(
              email: email,
              emailStatus: FormzStatus.invalid,
            ),
          );
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );

          expect(
            find.text(
              localizations.invalidEmail,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'email input field '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );

          expect(
            find.byKey(
              EmailView.kEmailInputKey,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'next button '
        'always',
        (tester) async {
          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );
          expect(
            find.byKey(
              EmailView.kNextButtonKey,
            ),
            findsOneWidget,
          );
        },
      );
    });

    group('does not render', () {
      testWidgets(
        'invalid email error text '
        'when email is valid',
        (tester) async {
          // We do use it.
          // ignore: unused_local_variable

          when(() => email.error).thenAnswer((_) => null);
          when(() => authenticationCubit.state).thenReturn(
            AuthenticationState(
              email: email,
              emailStatus: FormzStatus.invalid,
            ),
          );

          await tester.pumpWidget(
            bootstrap(
              const EmailView(),
            ),
          );
          expect(
            find.text(
              localizations.invalidEmail,
            ),
            findsNothing,
          );
        },
      );
    });
  });
}
