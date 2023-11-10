part of 'authentication.dart';

/// {@template authentication_form}
/// The form responsible for displaying email and password inputs when necessary. This form also handles
/// showing the appropriate error messages when requests fail and displaying a loading indicator when
/// requests are in progress.
/// {@endtemplate}
class AuthenticationForm extends StatefulWidget {
  /// {@macro authentication_form}
  const AuthenticationForm({
    super.key,
  });

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmedPasswordController.dispose();

    return super.dispose();
  }

  /// {@macro authentication_form}
  @visibleForTesting
  String getFailureMessage(
    BuildContext context,
    AuthenticationFailureStatus status,
  ) {
    final localizations = context.localizations;
    final reasons = {
      AuthenticationFailureStatus.invalidEmail: localizations.invalidEmail,
      AuthenticationFailureStatus.emailAlreadyInUse:
          localizations.emailAddressTaken,
      AuthenticationFailureStatus.wrongPassword: localizations.invalidPassword,
      AuthenticationFailureStatus.operationNotAllowed:
          localizations.operationNotAllowed,
      AuthenticationFailureStatus.weakPassword: localizations.weakPassword,
      AuthenticationFailureStatus.userDisabled: localizations.userDisabled,
      AuthenticationFailureStatus.userNotFound: localizations.userNotFound,
      AuthenticationFailureStatus.accountExistsWithDifferentCredential:
          localizations.accountExistsWithDifferentCredential,
      AuthenticationFailureStatus.invalidCredential:
          localizations.invalidCredential,
      AuthenticationFailureStatus.invalidVerificationCode:
          localizations.invalidVerificationCode,
      AuthenticationFailureStatus.invalidVerificationId:
          localizations.invalidVerificationId,
      AuthenticationFailureStatus.requiresRecentLogin:
          localizations.requiresRecentLogin,
      AuthenticationFailureStatus.missingAndroidPkgName:
          localizations.missingAndroidPkgName,
      AuthenticationFailureStatus.missingContinueUri:
          localizations.missingContinueUri,
      AuthenticationFailureStatus.missingIosBundleId:
          localizations.missingIosBundleId,
      AuthenticationFailureStatus.invalidContinueUri:
          localizations.invalidContinueUri,
      AuthenticationFailureStatus.unauthorizedContinueUri:
          localizations.unauthorizedContinueUri,
      AuthenticationFailureStatus.expiredActionCode:
          localizations.expiredActionCode,
      AuthenticationFailureStatus.invalidActionCode:
          localizations.invalidActionCode,
      AuthenticationFailureStatus.unauthenticated:
          localizations.unauthenticated,
      AuthenticationFailureStatus.unknown: localizations.unknownErrorOccured,
    };

    return reasons[status]!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.passwordResetStatus.isSubmissionSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  context.localizations.passwordResetSent(
                    state.email.value,
                  ),
                ),
              ),
            );
        }
      },
      listenWhen: (s1, s2) => s1.passwordResetStatus != s2.passwordResetStatus,
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) async {
          if (state.emailStatus.isSubmissionFailure ||
              state.passwordStatus.isSubmissionFailure ||
              state.passwordResetStatus.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    getFailureMessage(
                      context,
                      state.failureStatus,
                    ),
                  ),
                ),
              );
          }
        },
        listenWhen: (s1, s2) {
          if (s1.emailStatus != s2.emailStatus) return true;
          if (s1.passwordStatus != s2.passwordStatus) return true;
          if (s1.passwordResetStatus != s2.passwordResetStatus) return true;

          return false;
        },
        child: Stack(
          children: [
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              buildWhen: (s1, s2) =>
                  s1.type != s2.type &&
                  s2.type != AuthenticationType.authenticated,
              builder: (context, state) {
                if (state.type == AuthenticationType.unknown) {
                  return EmailView(
                    emailController: emailController,
                  );
                }

                return PasswordView(
                  passwordController: passwordController,
                  confirmedPasswordController: confirmedPasswordController,
                );
              },
            ),
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              buildWhen: (s1, s2) =>
                  s1.passwordStatus != s2.passwordStatus ||
                  s1.emailStatus != s2.emailStatus,
              builder: (context, state) {
                if (state.emailStatus.isSubmissionInProgress ||
                    state.passwordStatus.isSubmissionInProgress ||
                    state.passwordResetStatus.isSubmissionInProgress) {
                  return const Material(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgress(),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
