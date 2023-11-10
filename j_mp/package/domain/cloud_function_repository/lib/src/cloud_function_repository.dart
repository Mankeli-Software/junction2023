import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';

/// {@template cloud_functions_repository}
/// A repository for calling Cloud Functions.
/// {@endtemplate}
class CloudFunctionRepository extends Repository {
  /// {@macro cloud_functions_repository}
  CloudFunctionRepository({FirebaseApp? firebaseApp})
      : _functions = FirebaseFunctions.instanceFor(
          app: firebaseApp ?? Firebase.app(),
        );

  /// {@macro cloud_functions_repository}
  @visibleForTesting
  CloudFunctionRepository.mockable({required FirebaseFunctions functions})
      : _functions = functions;

  late final FirebaseFunctions _functions;

  /// Calls a cloud function with the given `functionName` and `parameters`.
  /// Returns a future that resolves to the data returned by the cloud function.
  Future<T> callFunction<T>(
    String functionName, {
    Map<String, dynamic>? parameters,
  }) async {
    final callable = _functions.httpsCallable(functionName);
    final result = await callable.call<T>(parameters);

    return result.data;
  }
}
