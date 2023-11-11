part of 'authentication.dart';

/// {@template authenticated_route_wrapper}
/// The router entry point for MHS Flutter Feature. This widget
/// is responsible wrapping all the authenticated routes with a non-declarative router
/// {@endtemplate}
@RoutePage()
class AuthenticatedRouteWrapper extends StatelessWidget {
  /// {@macro authenticated_route_wrapper}
  const AuthenticatedRouteWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
