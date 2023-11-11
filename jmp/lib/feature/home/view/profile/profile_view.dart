part of 'profile.dart';

/// {@template profile_view}
/// The view for [ProfileCubit].
/// {@endtemplate}
class ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            context.router.push(
              ActionGameRoute(
                title: 'Duel of Blades!',
                description:
                    'Engage in an epic duel with a swashbuckling pirate! Use your phone as your blade, swiping and slashing with precision to emerge victorious. Fail to triumph in the allotted time, and your seeker gets a fleeting glimpse of your whereabouts.',
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/pirate.png?alt=media&token=43fe5f0e-b1bf-4085-8a39-d8e5f071d9ed',
              ),
            );
          },
          child: const Text('open minigame'),
        );
      },
    );
  }
}
