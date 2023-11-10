part of 'authentication.dart';

/// {@template authentication_cubit}
/// This cubit is all about handling calls to AuthenticationRepository and managing the state for AuthenticationPage.
/// It's responsible for deciding whether to show the sign in screen or the sign up screen, and for keeping track of
/// when to show the loading indicator. Let's get this authentication process rolling!
/// {@endtemplate}
class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// {@macro authentication_cubit}
  AuthenticationCubit({
    required this.authenticationRepository,
  }) : super(const AuthenticationState());

  /// Initializes the cubit
  void initialize() {
    // Wait for the authentication stream to kick in
    _authChangeSubscription =
        authenticationRepository.authChanges.listen((user) {
      if (user.isNotEmpty) {
        emit(state.copyWith(type: AuthenticationType.authenticated));
      }
    });
  }

  /// {@macro authentication_cubit}
  late AuthenticationRepository authenticationRepository;

  StreamSubscription<User>? _authChangeSubscription;

  /// Clears password input fields and re-opens email screen.
  void backToEmail() {
    emit(
      state.copyWith(
        type: AuthenticationType.unknown,
        emailStatus: Formz.validate([state.email]),
      ),
    );
  }

  /// Called whenever the email input changes. Validates the input.
  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);

    emit(
      state.copyWith(
        email: email,
        emailStatus: Formz.validate([email]),
      ),
    );
  }

  /// Called whenever the password input changes. Validates the input.
  void updatePassword(String value) {
    final password = PasswordFormz.dirty(
      state.password.value.copyWith(
        first: value,
      ),
    );

    emit(
      state.copyWith(
        password: password,
        passwordStatus: Formz.validate([password]),
      ),
    );
  }

  /// Called whenever the password confirmation input changes. Validates the input.
  void updateConfirmedPassword(String value) {
    final password = PasswordFormz.dirty(
      state.password.value.copyWith(
        second: value,
      ),
    );

    emit(
      state.copyWith(
        password: password,
        passwordStatus: Formz.validate([password]),
      ),
    );
  }

  /// Checks if the entered email address exists within the apps auth providers.
  Future<void> checkForEmail() async {
    if (state.emailStatus.isSubmissionInProgress) return;
    if (state.emailStatus.isInvalid) return;
    emit(state.copyWith(emailStatus: FormzStatus.submissionInProgress));
    try {
      final exists = await authenticationRepository.doesUserExist(
        state.email.value,
      );
      emit(
        state.copyWith(
          emailStatus: FormzStatus.submissionSuccess,
          type: exists ? AuthenticationType.signIn : AuthenticationType.signUp,
          password: PasswordFormz.dirty(
            state.password.value.copyWith(
              requireConfirmation: !exists,
            ),
          ),
        ),
      );
    } on EmailLookupFailure catch (e) {
      emit(
        state.copyWith(
          emailStatus: FormzStatus.submissionFailure,
          failureStatus: e.status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          emailStatus: FormzStatus.submissionFailure,
          failureStatus: AuthenticationFailureStatus.unknown,
        ),
      );
    }
  }

  /// This method handles the calls to `AuthenticationRepository` for signing the user in.
  /// It takes the email address from `email` and the password from `password`.
  Future<void> signIn() async {
    if (state.passwordStatus.isSubmissionInProgress) return;
    if (state.passwordStatus.isInvalid) return;
    emit(state.copyWith(passwordStatus: FormzStatus.submissionInProgress));

    final email = state.email.value;
    final password = state.password.value.first!;
    AppLogger.d('Signing in with $email');

    try {
      await authenticationRepository.signIn(email: email, password: password);
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionSuccess,
        ),
      );
    } on SignInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionFailure,
          failureStatus: e.status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionFailure,
          failureStatus: AuthenticationFailureStatus.unknown,
        ),
      );
    }
  }

  /// This method handles the calls to `AuthenticationRepository` for signing the user up.
  /// It takes the email address from `email` and the password from `password` (and secondary checkup from `confirmedPassword`).
  Future<void> signUp() async {
    if (state.passwordStatus.isSubmissionInProgress) return;
    if (state.passwordStatus.isInvalid) return;
    emit(
      state.copyWith(
        passwordStatus: FormzStatus.submissionInProgress,
      ),
    );
    final email = state.email.value;
    final password = state.password.value.first!;

    AppLogger.d('Signing up with $email');

    try {
      await authenticationRepository.signUp(email: email, password: password);
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionSuccess,
        ),
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionFailure,
          failureStatus: e.status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          passwordStatus: FormzStatus.submissionFailure,
          failureStatus: AuthenticationFailureStatus.unknown,
        ),
      );
    }
  }

  /// Sends a request to reset password to the email address provided in
  /// `email` in the state.
  Future<void> requestPasswordReset() async {
    if (state.passwordResetStatus.isSubmissionInProgress) return;
    emit(
      state.copyWith(
        passwordResetStatus: FormzStatus.submissionInProgress,
      ),
    );
    final email = state.email.value;

    AppLogger.d('Sending password reset email to $email');

    try {
      await authenticationRepository.requestPasswordReset(
        email: email,
      );

      emit(
        state.copyWith(
          passwordResetStatus: FormzStatus.submissionSuccess,
        ),
      );
    } on PasswordResetRequestFailure catch (e) {
      emit(
        state.copyWith(
          passwordResetStatus: FormzStatus.submissionFailure,
          failureStatus: e.status,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          passwordResetStatus: FormzStatus.submissionFailure,
          failureStatus: AuthenticationFailureStatus.unknown,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _authChangeSubscription?.cancel();

    return super.close();
  }
}
