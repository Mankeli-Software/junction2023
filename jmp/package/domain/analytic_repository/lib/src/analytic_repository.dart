import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';

/// {@template analytics_repository}
/// A repository which manages logging events to Firebase Analytics.
/// {@endtemplate}
class AnalyticRepository extends Repository {
  /// {@macro analytics_repository}
  AnalyticRepository({FirebaseApp? firebaseApp})
      : _analytics =
            FirebaseAnalytics.instanceFor(app: firebaseApp ?? Firebase.app());

  /// {@macro analytics_repository}
  /// This constructor is used for testing purposes.
  @visibleForTesting
  AnalyticRepository.mockable({required FirebaseAnalytics analytics})
      : _analytics = analytics;

  late final FirebaseAnalytics _analytics;

  /// {@macro analytics_repository}
  ///
  /// [logAppOpen] logs app opening
  void logAppOpen() {
    unawaited(_analytics.logAppOpen());
  }

  /// {@macro analytics_repository}
  ///
  /// [logSignIn] logs sign in
  void logSignIn(String method) {
    unawaited(_analytics.logLogin(loginMethod: method));
  }

  /// {@macro analytics_repository}
  ///
  ///  [logSignUp] logs sign up
  void logSignUp(String method) {
    unawaited(_analytics.logSignUp(signUpMethod: method));
  }

  /// {@macro analytics_repository}
  ///
  /// [logStartupLogicComplete] logs startup logic completed
  void logStartupLogicComplete() {
    unawaited(_analytics.logEvent(name: 'startup_logic_complete'));
  }

  /// {@macro analytics_repository}
  ///
  /// [logEvent] logs a custom event with the given name
  void logEvent(String name) {
    unawaited(_analytics.logEvent(name: name));
  }

  /// {@macro analytics_repository}
  ///
  /// [logRouteChange] logs navigator route changes
  void logRouteChange(String route) {
    unawaited(
      _analytics.logScreenView(
        screenName: route,
        screenClass: route,
      ),
    );
  }
}
