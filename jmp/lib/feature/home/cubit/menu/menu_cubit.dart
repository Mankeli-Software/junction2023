part of 'menu.dart';

/// {@template menu_cubit}
/// A [Cubit] for Home. -feature.
///
/// This cubit is responsible for
/// showing general menu
///
/// {@endtemplate}
class MenuCubit extends Cubit<MenuState> {
  /// {@macro menu_cubit}
  MenuCubit() : super(const MenuState());

  /// Initializes the [MenuCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: MenuStatus.idle,
      ),
    );
  }
}
