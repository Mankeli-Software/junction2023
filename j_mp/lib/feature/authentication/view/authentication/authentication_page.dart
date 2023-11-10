part of 'authentication.dart';

/// {@template authentication_page}
/// A page that handles the authentication flow:
///  1. User enters email
///  2. If the email is already associated with an account, the user is asked for the existing password (sign in)
///  3. If the email is not associated with an account, the user is asked to create a password (sign up)
/// {@endtemplate}
@RoutePage()
class AuthenticationPage extends StatelessWidget {
  /// {@macro authentication_page}
  const AuthenticationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        )..initialize(),
        child: const AuthenticationForm(),
      ),
    );
  }
}
