part of 'home.dart';

/// {@template home_cubit}
/// A [Cubit] for Home. -feature.
///
/// This cubit is responsible for
/// being the starting point of the application, typically contains some sort of menu structure
///
/// {@endtemplate}
class HomeCubit extends Cubit<HomeState> {
  /// {@macro home_cubit}
  HomeCubit() : super(const HomeState());

  /// Initializes the [HomeCubit] by:
  /// x, y and z
  void initialize() {
    /// Add initializing steps here.

    emit(
      state.copyWith(
        status: HomeStatus.idle,
      ),
    );
  }

  /// Sets the current route
  void setRoute(PageRouteInfo route) {
    emit(
      state.copyWith(
        currentRoute: route,
      ),
    );
  }
}
