import 'package:cloud_function_repository/cloud_function_repository.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
// We do depend
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseFunctions extends Mock implements FirebaseFunctions {}

class MockCloudFunctionRepository extends Mock implements CloudFunctionRepository {}

class MockHttpsCallable extends Mock implements HttpsCallable {}

class MockHttpsCallableResult extends Mock implements HttpsCallableResult<dynamic> {}

class MockFirebaseCore extends Mock with MockPlatformInterfaceMixin implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FirebaseFunctions firebaseFunctions;
  late CloudFunctionRepository cloudFunctionRepository;
  late HttpsCallable httpsCallable;
  late HttpsCallableResult<dynamic> httpsCallableResult;

  group('CloudFunctionsRepository', () {
    setUp(() {
      const options = FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      );
      final platformApp = FirebaseAppPlatform(defaultFirebaseAppName, options);
      final firebaseCore = MockFirebaseCore();

      when(() => firebaseCore.apps).thenReturn([platformApp]);
      when(firebaseCore.app).thenReturn(platformApp);
      when(
        () => firebaseCore.initializeApp(
          name: defaultFirebaseAppName,
          options: options,
        ),
      ).thenAnswer((_) async => platformApp);

      Firebase.delegatePackingProperty = firebaseCore;

      firebaseFunctions = MockFirebaseFunctions();
      httpsCallable = MockHttpsCallable();
      httpsCallableResult = MockHttpsCallableResult();
      cloudFunctionRepository = CloudFunctionRepository.mockable(functions: firebaseFunctions);
    });

    test(
      'creates FirebaseFunctions '
      'when not injected',
      () {
        expect(CloudFunctionRepository.new, isNot(throwsException));
      },
    );

    test(
      'calls a cloud function with the given name and parameters '
      'when callFunction is called',
      () async {
        const functionName = 'functionName';
        const parameters = <String, dynamic>{'key': 'value'};
        const result = {
          'data': 'data',
          'status': '200',
        };
        when(() => firebaseFunctions.httpsCallable(functionName)).thenReturn(httpsCallable);
        when(() => httpsCallable.call<dynamic>(parameters)).thenAnswer((_) => Future.value(httpsCallableResult));
        when(() => httpsCallableResult.data).thenReturn(result);

        final data = await cloudFunctionRepository.callFunction<dynamic>(functionName, parameters: parameters);
        verify(() => firebaseFunctions.httpsCallable(functionName)).called(1);
        verify(() => httpsCallable.call<dynamic>(parameters)).called(1);
        expect(data, equals(result));
      },
    );
  });
}
