part of 'authentication.dart';

/// {@template email_view}
/// A input for retrieving the email address.
/// {@endtemplate}
class EmailView extends StatelessWidget {
  /// {@macro email_page}
  const EmailView({
    super.key,
    this.emailController,
  });

  /// {@macro email_view}
  @visibleForTesting
  static const kEmailInputKey = Key('EmailView_emailInput');

  /// {@macro email_view}
  @visibleForTesting
  static const kNextButtonKey = Key('EmailView_nextButton');

  /// The controller for the email input.
  final TextEditingController? emailController;

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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Text(
                  localizations.welcomeText,
                  style: theme.displaySmall.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 30,
                ),
                child: Text(
                  localizations.emailExplanation,
                  style: theme.titleLarge,
                ),
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.email != s2.email,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextField(
                      controller: emailController,
                      key: kEmailInputKey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.localizations.email,
                        errorText:
                            state.email.error != null && !state.email.pure
                                ? context.localizations.invalidEmail
                                : null,
                      ),
                      onChanged:
                          context.read<AuthenticationCubit>().updateEmail,
                    ),
                  );
                },
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (s1, s2) => s1.emailStatus != s2.emailStatus,
                builder: (context, state) {
                  final enabled = state.emailStatus.isValid ||
                      state.emailStatus.isSubmissionFailure ||
                      state.emailStatus.isSubmissionCanceled;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      key: kNextButtonKey,
                      onPressed: !enabled
                          ? null
                          : () => context
                              .read<AuthenticationCubit>()
                              .checkForEmail(),
                      child: Text(
                        context.localizations.next,
                      ),
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
