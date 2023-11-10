part of 'authentication.dart';

/// {@template password_view}
/// A input for retrieving password and password confirmation
/// {@endtemplate}
class PasswordView extends StatelessWidget {
  /// {@macro password_page}
  const PasswordView({
    super.key,
    this.passwordController,
    this.confirmedPasswordController,
  });

  /// {@macro password_view}
  @visibleForTesting
  static String? getPasswordErrorText(
    PasswordValidationError? error,
    AppLocalizations localizations,
  ) {
    if (error == null) return null;
    switch (error) {
      case PasswordValidationError.mustBeAtLeast8Characters:
        return localizations.passwordMustBeAtLeast8Characters;
      case PasswordValidationError.mustContainNumber:
        return localizations.passwordMustContainNumber;
      case PasswordValidationError.mustContainCapitalLetter:
        return localizations.passwordMustContainCapitalLetter;
      case PasswordValidationError.mustContainLowercaseLetter:
        return localizations.passwordMustContainLowercaseLetter;
      case PasswordValidationError.mustEqualConfirmation:
        return localizations.passwordMismatch;
    }
  }

  /// {@macro password_view}
  @visibleForTesting
  static const kAuthenticateButtonKey = Key('PasswordView_authenticateButton');

  /// {@macro password_view}
  @visibleForTesting
  static const kPreviouseButtonKey = Key('PasswordView_previousButton');

  /// {@macro password_view}
  @visibleForTesting
  static const kPasswordInputKey = Key('PasswordView_passwordInput');

  /// {@macro password_view}
  @visibleForTesting
  static const kConfirmedPasswordInputKey =
      Key('PasswordView_confirmedPasswordInput');

  /// The controller for the password input.
  final TextEditingController? passwordController;

  /// The controller for the confirmed password input.
  final TextEditingController? confirmedPasswordController;

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    final theme = context.theme;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.email != s2.email,
                builder: (context, state) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      child: Text(
                        localizations.personatedWelcomeText(state.email.value),
                        style: theme.displaySmall.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.type != s2.type,
                builder: (context, state) {
                  final text = state.type == AuthenticationType.signIn
                      ? localizations.signInExplanation
                      : localizations.signUpExplanation;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 30,
                    ),
                    child: Text(
                      text,
                      style: theme.titleLarge,
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.password != s2.password,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      controller: passwordController,
                      key: kPasswordInputKey,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: localizations.password,
                        errorText: state.password.pure
                            ? null
                            : getPasswordErrorText(
                                state.password.error,
                                localizations,
                              ),
                      ),
                      obscureText: true,
                      onChanged:
                          context.read<AuthenticationCubit>().updatePassword,
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.password != s2.password,
                builder: (context, state) {
                  if (state.type == AuthenticationType.signUp) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: confirmedPasswordController,
                        key: kConfirmedPasswordInputKey,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: localizations.confirmedPassword,
                          errorText: state.password.pure
                              ? null
                              : getPasswordErrorText(
                                  state.password.error,
                                  localizations,
                                ),
                        ),
                        obscureText: true,
                        onChanged: context
                            .read<AuthenticationCubit>()
                            .updateConfirmedPassword,
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) =>
                    s1.passwordResetStatus != s2.passwordResetStatus,
                builder: (context, state) {
                  final resetEnabled =
                      !state.passwordResetStatus.isSubmissionInProgress;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          key: kPreviouseButtonKey,
                          onPressed: !resetEnabled
                              ? null
                              : () => context
                                  .read<AuthenticationCubit>()
                                  .requestPasswordReset(),
                          child: Text(
                            localizations.resetPassword,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.passwordStatus != s2.passwordStatus,
                builder: (context, state) {
                  final previouseEnabled =
                      !state.passwordStatus.isSubmissionInProgress;

                  final authenticateEnabled = state.passwordStatus.isValid ||
                      state.passwordStatus.isSubmissionFailure ||
                      state.passwordStatus.isSubmissionCanceled;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          key: kPreviouseButtonKey,
                          onPressed: !previouseEnabled
                              ? null
                              : () => context
                                  .read<AuthenticationCubit>()
                                  .backToEmail(),
                          child: Text(
                            localizations.previouse,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          key: kAuthenticateButtonKey,
                          onPressed: !authenticateEnabled
                              ? null
                              : () {
                                  if (state.type == AuthenticationType.signIn) {
                                    context
                                        .read<AuthenticationCubit>()
                                        .signIn();
                                  } else {
                                    context
                                        .read<AuthenticationCubit>()
                                        .signUp();
                                  }
                                },
                          child: Text(
                            state.type == AuthenticationType.signIn
                                ? localizations.signIn
                                : localizations.signUp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
