part of 'hide_and_seek.dart';

/// {@template hide_and_seek_view}
/// The view for [HideAndSeekCubit].
/// {@endtemplate}
class HideAndSeekView extends StatelessWidget {
  /// {@macro hide_and_seek_view}
  const HideAndSeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HideAndSeekCubit, HideAndSeekState>(
      listenWhen: (s1, s2) => true,
      listener: (context, state) {
        return;
      },
      buildWhen: (s1, s2) => true,
      builder: (context, state) {
        return const Placeholder();
      },
    );
  }
}
