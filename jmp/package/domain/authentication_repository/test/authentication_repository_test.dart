import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

const _mockFirebaseUserId = 'mock-id';
const _mockFirebaseUserEmail = 'mock@mock.com';

class MockFirebaseAuth extends Mock implements auth.FirebaseAuth {}

class MockFirebaseUser extends Mock implements auth.User {}

class MockUserCredential extends Mock implements auth.UserCredential {}

class FakeAuthCredential extends Fake implements auth.AuthCredential {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const email = 'test@gmail.com';
  const password = 's3cr3tp4ssw0rd';

  const user = User(
    id: _mockFirebaseUserId,
    email: _mockFirebaseUserEmail,
  );
  group(
    'AuthenticationRepository',
    () {
      late auth.FirebaseAuth firebaseAuth;

      late AuthenticationRepository authenticationRepository;
      late MockFirebaseUser anonymousAuthUser;
      late MockFirebaseUser authUser;

      setUpAll(() {
        registerFallbackValue(FakeAuthCredential());
        registerFallbackValue(user);
      });

      setUp(() async {
        const options = FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId',
        );
        final platformApp =
            FirebaseAppPlatform(defaultFirebaseAppName, options);
        final firebaseCore = MockFirebaseCore();

        when(() => firebaseCore.apps).thenReturn([platformApp]);
        when(firebaseCore.app).thenReturn(platformApp);
        when(
          () => firebaseCore.initializeApp(
            name: defaultFirebaseAppName,
            options: options,
          ),
        ).thenAnswer((_) async => platformApp);

        Firebase.delegatePackingProperty = firebaseCore;

        firebaseAuth = MockFirebaseAuth();

        when(() => firebaseAuth.authStateChanges()).thenAnswer(
          (_) => const Stream<auth.User?>.empty(),
        );

        authenticationRepository = AuthenticationRepository.mockable(
          firebaseAuth: firebaseAuth,
        );

        await authenticationRepository.initialize();

        anonymousAuthUser = MockFirebaseUser();
        authUser = MockFirebaseUser();

        when(() => anonymousAuthUser.isAnonymous).thenReturn(true);
        when(() => authUser.isAnonymous).thenReturn(false);
      });

      test(
        'creates FirebaseApp, DatabaseRepository and AnalyticRepository '
        'when not injected',
        () {
          expect(
            AuthenticationRepository(),
            isNot(throwsException),
          );
        },
      );

      group('signOut', () {
        setUp(() {
          when(() => firebaseAuth.signOut()).thenAnswer((_) async {
            return;
          });
          when(anonymousAuthUser.delete).thenAnswer((_) async {
            return;
          });
          when(authUser.delete).thenAnswer((_) async {
            return;
          });
        });
        test(
          'calls deleteUser '
          'when user is anonymous',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(anonymousAuthUser);

            await authenticationRepository.signOut();

            verify(anonymousAuthUser.delete).called(1);

            verifyNever(() => firebaseAuth.signOut());
          },
        );

        test(
          'calls signOut '
          'when user is not anonymous',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(authUser);

            await authenticationRepository.signOut();

            verify(() => firebaseAuth.signOut()).called(1);

            verifyNever(authUser.delete);
          },
        );

        test(
          'throws SignOutFailure '
          'when a recent login is required',
          () async {
            when(anonymousAuthUser.delete).thenThrow(
              auth.FirebaseAuthException(code: kRequiresRecentLoginError),
            );
            when(() => firebaseAuth.currentUser).thenReturn(anonymousAuthUser);

            expect(
              authenticationRepository.signOut(),
              throwsA(
                predicate<SignOutFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.requiresRecentLogin,
                ),
              ),
            );
          },
        );

        test(
          'throws SignOutFailure '
          'when user is unauthenticated',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(null);

            expect(
              authenticationRepository.signOut(),
              throwsA(
                predicate<SignOutFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.unauthenticated,
                ),
              ),
            );
          },
        );
      });

      group('deleteUser', () {
        test(
          'throws DeleteUserFailure '
          'when user is unauthenticated',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(null);

            expect(
              authenticationRepository.deleteUser(),
              throwsA(
                predicate<DeleteUserFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.unauthenticated,
                ),
              ),
            );
          },
        );

        test(
          'throws DeleteUserFailure '
          'when a recent login is required',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(authUser);
            when(authUser.delete).thenThrow(
              auth.FirebaseAuthException(code: kRequiresRecentLoginError),
            );

            expect(
              authenticationRepository.deleteUser(),
              throwsA(
                predicate<DeleteUserFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.requiresRecentLogin,
                ),
              ),
            );

            verify(authUser.delete).called(1);
          },
        );

        test(
          'logs deleteUser event to analytics to analytics '
          'when user is deleted',
          () async {
            when(() => firebaseAuth.currentUser).thenReturn(authUser);
            when(authUser.delete).thenAnswer((_) async {
              return;
            });

            await authenticationRepository.deleteUser();

            verify(authUser.delete).called(1);
          },
        );
      });

      group('doesUserExist', () {
        test(
          'returns true '
          'when user with given email does exist',
          () async {
            when(() => firebaseAuth.fetchSignInMethodsForEmail(any<String>()))
                .thenAnswer((_) async => ['email/password']);

            final result = await authenticationRepository.doesUserExist(email);

            expect(result, equals(true));
            verify(() => firebaseAuth.fetchSignInMethodsForEmail(email))
                .called(1);
          },
        );

        test(
          'returns false '
          'when user with given email does not exist',
          () async {
            when(() => firebaseAuth.fetchSignInMethodsForEmail(any<String>()))
                .thenAnswer((_) async => []);

            final result = await authenticationRepository.doesUserExist(email);

            expect(result, equals(false));
            verify(() => firebaseAuth.fetchSignInMethodsForEmail(email))
                .called(1);
          },
        );

        test(
          'throws EmailLookupFailure '
          'when the given email is invalid',
          () async {
            when(() => firebaseAuth.fetchSignInMethodsForEmail(any<String>()))
                .thenThrow(
              auth.FirebaseAuthException(code: kInvalidEmailError),
            );

            expect(
              authenticationRepository.doesUserExist(email),
              throwsA(
                predicate<EmailLookupFailure>(
                  (f) => f.status == AuthenticationFailureStatus.invalidEmail,
                ),
              ),
            );

            verify(() => firebaseAuth.fetchSignInMethodsForEmail(email))
                .called(1);
          },
        );
      });

      group('signIn', () {
        test(
          'throws SignInWithEmailAndPasswordFailure '
          'when the given email is invalid',
          () async {
            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kInvalidEmailError),
            );

            expect(
              authenticationRepository.signIn(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignInWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.invalidEmail,
                ),
              ),
            );

            verify(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignInWithEmailAndPasswordFailure '
          'when the user with given email is disabled by admins',
          () async {
            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kUserDisabledError),
            );

            expect(
              authenticationRepository.signIn(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignInWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.userDisabled,
                ),
              ),
            );
            verify(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignInWithEmailAndPasswordFailure '
          'when cannot find user with given email',
          () async {
            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kUserNotFoundError),
            );

            expect(
              authenticationRepository.signIn(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignInWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.userNotFound,
                ),
              ),
            );
            verify(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
            'throws SignInWithEmailAndPasswordFailure '
            'when password is wrong for the given email', () async {
          when(
            () => firebaseAuth.signInWithEmailAndPassword(
              email: any<String>(named: 'email'),
              password: any<String>(named: 'password'),
            ),
          ).thenThrow(
            auth.FirebaseAuthException(code: kWrongPasswordError),
          );

          expect(
            authenticationRepository.signIn(email: email, password: password),
            throwsA(
              predicate<SignInWithEmailAndPasswordFailure>(
                (f) => f.status == AuthenticationFailureStatus.wrongPassword,
              ),
            ),
          );
          verify(
            () => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            ),
          ).called(1);
        });

        test(
          'throws SignInWithEmailAndPasswordFailure '
          'when credentials returned by signInWithEmailAndPassword are null',
          () async {
            final credentials = MockUserCredential();
            when(() => credentials.user).thenReturn(null);

            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenAnswer((_) => Future.value(credentials));

            expect(
              authenticationRepository.signIn(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignInWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.unknown,
                ),
              ),
            );
            verify(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );
        test(
          'logs signIn event to analytics '
          'when user is signed in',
          () async {
            final credentials = MockUserCredential();
            when(() => credentials.user).thenReturn(MockFirebaseUser());

            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenAnswer((_) => Future.value(credentials));

            await authenticationRepository.signIn(
              email: email,
              password: password,
            );

            verify(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );
      });

      group('signUp', () {
        test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when the given email is invalid',
          () async {
            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kInvalidEmailError),
            );

            expect(
              authenticationRepository.signUp(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignUpWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.invalidEmail,
                ),
              ),
            );

            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when the given email is already in use',
          () async {
            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kEmailAlreadyInUseError),
            );

            expect(
              authenticationRepository.signUp(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignUpWithEmailAndPasswordFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.emailAlreadyInUse,
                ),
              ),
            );

            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when email/password authentication is not enabled',
          () async {
            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kOperationNotAllowedError),
            );

            expect(
              authenticationRepository.signUp(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignUpWithEmailAndPasswordFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.operationNotAllowed,
                ),
              ),
            );

            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when the given password is too weak',
          () async {
            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kWeakPasswordError),
            );

            expect(
              authenticationRepository.signUp(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignUpWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.weakPassword,
                ),
              ),
            );

            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );

        test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when credentials returned by createUserWithEmailAndPassword are null',
          () async {
            final credentials = MockUserCredential();
            when(() => credentials.user).thenReturn(null);

            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenAnswer((_) => Future.value(credentials));

            expect(
              authenticationRepository.signUp(
                email: email,
                password: password,
              ),
              throwsA(
                predicate<SignUpWithEmailAndPasswordFailure>(
                  (f) => f.status == AuthenticationFailureStatus.unknown,
                ),
              ),
            );
            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );
        test(
          'logs signUp event to analytics '
          'when user is signed up',
          () async {
            final credentials = MockUserCredential();
            when(() => credentials.user).thenReturn(MockFirebaseUser());

            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: any<String>(named: 'email'),
                password: any<String>(named: 'password'),
              ),
            ).thenAnswer((_) => Future.value(credentials));

            await authenticationRepository.signUp(
              email: email,
              password: password,
            );

            verify(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ),
            ).called(1);
          },
        );
      });

      group('requestPasswordReset', () {
        test(
          'logs passwordResetRequest event to analytics '
          'when password reset is requested',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenAnswer((invocation) async {
              return;
            });

            await authenticationRepository.requestPasswordReset(
              email: email,
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when the given email is incorrect',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: 'auth/$kInvalidEmailError'),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) => f.status == AuthenticationFailureStatus.invalidEmail,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when no user is found for the given email',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: 'auth/$kUserNotFoundError'),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) => f.status == AuthenticationFailureStatus.userNotFound,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when no android package name is provided',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(
                code: 'auth/$kMissingAndroidPkgNameError',
              ),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.missingAndroidPkgName,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when no continue uri is provided',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(
                code: 'auth/$kMissingContinueUriError',
              ),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.missingContinueUri,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when no ios bundle id is provided',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(
                code: 'auth/$kMissingIosBundleIdError',
              ),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.missingIosBundleId,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when invalid continue uri is provided',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(
                code: 'auth/$kInvalidContinueUriError',
              ),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.invalidContinueUri,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );

        test(
          'throws PasswordResetRequestFailure '
          'when unauthorized continue uri is provided',
          () async {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: any<String>(named: 'email'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(
                code: 'auth/$kUnauthorizedContinueUriError',
              ),
            );

            expect(
              authenticationRepository.requestPasswordReset(email: email),
              throwsA(
                predicate<PasswordResetRequestFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.unauthorizedContinueUri,
                ),
              ),
            );

            verify(() => firebaseAuth.sendPasswordResetEmail(email: email))
                .called(1);
          },
        );
      });

      group('confirmPasswordReset', () {
        const newPassword = 'newPassword';
        const code = 'code';

        test(
          'logs passwordResetConfirmation event to analytics '
          'when password reset is confirmed',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenAnswer((invocation) async {
              return;
            });

            await authenticationRepository.confirmPasswordReset(
              newPassword: newPassword,
              code: code,
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );

        test(
          'throws PasswordResetConfirmationFailure '
          'when the given action code is expired',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kExpiredActionCodeError),
            );

            expect(
              authenticationRepository.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
              throwsA(
                predicate<PasswordResetConfirmationFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.expiredActionCode,
                ),
              ),
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );

        test(
          'throws PasswordResetConfirmationFailure '
          'when the given action code is invalid',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kInvalidActionCodeError),
            );

            expect(
              authenticationRepository.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
              throwsA(
                predicate<PasswordResetConfirmationFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.invalidActionCode,
                ),
              ),
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );

        test(
          'throws PasswordResetConfirmationFailure '
          'when the user is disabled',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kUserDisabledError),
            );

            expect(
              authenticationRepository.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
              throwsA(
                predicate<PasswordResetConfirmationFailure>(
                  (f) => f.status == AuthenticationFailureStatus.userDisabled,
                ),
              ),
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );

        test(
          'throws PasswordResetConfirmationFailure '
          'when the user is not found',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kUserNotFoundError),
            );

            expect(
              authenticationRepository.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
              throwsA(
                predicate<PasswordResetConfirmationFailure>(
                  (f) => f.status == AuthenticationFailureStatus.userNotFound,
                ),
              ),
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );

        test(
          'throws PasswordResetConfirmationFailure '
          'when the given password is too weak',
          () async {
            when(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: any<String>(named: 'newPassword'),
                code: any<String>(named: 'code'),
              ),
            ).thenThrow(
              auth.FirebaseAuthException(code: kWeakPasswordError),
            );

            expect(
              authenticationRepository.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
              throwsA(
                predicate<PasswordResetConfirmationFailure>(
                  (f) => f.status == AuthenticationFailureStatus.weakPassword,
                ),
              ),
            );

            verify(
              () => firebaseAuth.confirmPasswordReset(
                newPassword: newPassword,
                code: code,
              ),
            ).called(1);
          },
        );
      });

      group('saveCurrentUserData', () {
        late auth.User firebaseUser;
        late User userToSave;
        const email = 'newEmail';
        const photoUrl = 'newPhotoUrl';
        const displayName = 'newDisplayName';
        setUp(() {
          userToSave = const User(
            id: 'id',
            email: email,
            photoUrl: photoUrl,
            displayName: displayName,
          );

          firebaseUser = MockFirebaseUser();
          when(() => firebaseAuth.currentUser).thenReturn(firebaseUser);
          when(() => firebaseUser.updatePhotoURL(any())).thenAnswer((_) async {
            return;
          });
          when(() => firebaseUser.updateDisplayName(any()))
              .thenAnswer((_) async {
            return;
          });
          when(() => firebaseUser.updateEmail(any())).thenAnswer((_) async {
            return;
          });
          when(() => firebaseUser.email).thenReturn('oldEmail');
          when(() => firebaseUser.photoURL).thenReturn('oldPhotoUrl');
          when(() => firebaseUser.displayName).thenReturn('oldDisplayName');
        });

        test(
          'logs saveCurrentUserData event to analytics '
          'when data is succesfully saved',
          () async {
            await authenticationRepository.saveCurrentUserData(user: user);
          },
        );

        test(
          'calls updateEmail, updatePhotoURL and updateDisplayName '
          'when the data is updated',
          () async {
            await authenticationRepository.saveCurrentUserData(
              user: userToSave,
            );

            verify(() => firebaseUser.updateEmail(email)).called(1);
            verify(() => firebaseUser.updatePhotoURL(photoUrl)).called(1);
            verify(() => firebaseUser.updateDisplayName(displayName)).called(1);
          },
        );

        test(
          'does not call updateEmail, updatePhotoURL and updateDisplayName '
          'when the data is not updated',
          () async {
            when(() => firebaseUser.email).thenReturn(email);
            when(() => firebaseUser.photoURL).thenReturn(photoUrl);
            when(() => firebaseUser.displayName).thenReturn(displayName);

            await authenticationRepository.saveCurrentUserData(
              user: userToSave,
            );

            verifyNever(() => firebaseUser.updatePhotoURL(photoUrl));
            verifyNever(() => firebaseUser.updateEmail(email));
            verifyNever(() => firebaseUser.updateDisplayName(displayName));
          },
        );

        test(
          'throws SaveUserFailure '
          'when the given email is invalid',
          () async {
            when(
              () => firebaseUser.updateEmail(any()),
            ).thenThrow(
              auth.FirebaseAuthException(code: kInvalidEmailError),
            );

            expect(
              authenticationRepository.saveCurrentUserData(
                user: userToSave,
              ),
              throwsA(
                predicate<SaveUserFailure>(
                  (f) => f.status == AuthenticationFailureStatus.invalidEmail,
                ),
              ),
            );

            verify(() => firebaseUser.updateEmail(email)).called(1);
          },
        );

        test(
          'throws SaveUserFailure '
          'when the given email is already in use',
          () async {
            when(
              () => firebaseUser.updateEmail(any()),
            ).thenThrow(
              auth.FirebaseAuthException(code: kEmailAlreadyInUseError),
            );

            expect(
              authenticationRepository.saveCurrentUserData(
                user: userToSave,
              ),
              throwsA(
                predicate<SaveUserFailure>(
                  (f) =>
                      f.status == AuthenticationFailureStatus.emailAlreadyInUse,
                ),
              ),
            );

            verify(() => firebaseUser.updateEmail(email)).called(1);
          },
        );

        test(
          'throws SaveUserFailure '
          'when a recent login is required',
          () async {
            when(
              () => firebaseUser.updateEmail(any()),
            ).thenThrow(
              auth.FirebaseAuthException(code: kRequiresRecentLoginError),
            );

            expect(
              authenticationRepository.saveCurrentUserData(
                user: userToSave,
              ),
              throwsA(
                predicate<SaveUserFailure>(
                  (f) =>
                      f.status ==
                      AuthenticationFailureStatus.requiresRecentLogin,
                ),
              ),
            );

            verify(() => firebaseUser.updateEmail(email)).called(1);
          },
        );
      });

      group(
        'authChanges',
        () {
          test(
            'emits User.empty '
            'when firebase user is null',
            () async {
              when(() => firebaseAuth.authStateChanges())
                  .thenAnswer((_) => Stream.value(null));
              await expectLater(
                authenticationRepository.authChanges,
                emitsInOrder(const <User>[User.unAuthenticated]),
              );
            },
          );

          test(
            'emits User '
            'when firebase user is not null',
            () async {
              final firebaseUser = MockFirebaseUser();
              when(() => firebaseUser.uid).thenReturn(_mockFirebaseUserId);
              when(() => firebaseUser.email).thenReturn(_mockFirebaseUserEmail);
              when(() => firebaseUser.photoURL).thenReturn(null);
              when(() => firebaseUser.displayName).thenReturn(null);

              when(() => firebaseAuth.authStateChanges()).thenAnswer(
                (_) => Stream.value(firebaseUser),
              );
              await expectLater(
                authenticationRepository.authChanges,
                emitsInOrder(const <User>[user]),
              );
            },
          );
        },
      );
    },
  );
}
