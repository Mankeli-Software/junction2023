part of 'profile.dart';

/// {@template profile_page}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping [ProfileView] with a provider of type
/// [ProfileCubit] and a [Scaffold]
/// {@endtemplate}
@RoutePage()
class ProfilePage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ProfileCubit>(
        create: (_) => ProfileCubit()..initialize(),
        child: const ProfileView(),
      ),
    );
  }
}
