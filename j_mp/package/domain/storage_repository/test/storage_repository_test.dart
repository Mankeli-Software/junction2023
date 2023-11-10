import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
// We do actually depend on it.
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:storage_repository/storage_repository.dart';

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockReference extends Mock implements Reference {}

class MockUploadTask extends Mock implements UploadTask {}

class MockTaskSnapshot extends Mock implements TaskSnapshot {}

class MockFile extends Mock implements File {}

class MockFirebaseCore extends Mock with MockPlatformInterfaceMixin implements FirebasePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FirebaseStorage firebaseStorage;
  late StorageRepository storageRepository;

  setUp(
    () async {
      registerFallbackValue(File(''));
      registerFallbackValue(SettableMetadata());
      registerFallbackValue(() {});
      const options = FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
        storageBucket: 'storageBucket',
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
      firebaseStorage = MockFirebaseStorage();
      storageRepository = StorageRepository.mockable(storage: firebaseStorage);
    },
  );
  group(
    'LoggingRepository',
    () {
      test(
        'creates FirebaseStorage '
        'when not injected',
        () {
          expect(StorageRepository.new, isNot(throwsException));
        },
      );

      group(
        'uploadFile',
        () {
          late Reference storageRef;
          late Reference childRef;
          late UploadTask uploadTask;
          late TaskSnapshot taskSnapshot;
          late Reference snapshotRef;
          const uploadPath = 'uploads/123';
          const testUrl = 'https://test.com/uploads/123';

          setUp(
            () {
              storageRef = MockReference();
              childRef = MockReference();
              uploadTask = MockUploadTask();
              taskSnapshot = MockTaskSnapshot();
              snapshotRef = MockReference();
              when(() => firebaseStorage.ref()).thenReturn(storageRef);
              when(() => storageRef.child(uploadPath)).thenReturn(childRef);
              when(() => childRef.putFile(any<File>(), any<SettableMetadata>())).thenAnswer((_) => uploadTask);
              when(() => uploadTask.whenComplete(any())).thenAnswer((_) async => Future.value(taskSnapshot));
              when(() => taskSnapshot.ref).thenReturn(snapshotRef);
              when(() => snapshotRef.getDownloadURL()).thenAnswer((_) async => testUrl);
            },
          );

          test(
            'returns the correct url '
            'when upload is successful',
            () async {
              final file = MockFile();
              when(file.existsSync).thenReturn(true);
              final result = await storageRepository.uploadFile(
                file: file,
                uploadPath: uploadPath,
              );

              expect(result, equals(testUrl));
            },
          );

          test(
            'throws FileNotFoundFailure '
            'when given file does not exist',
            () async {
              final file = MockFile();
              when(file.existsSync).thenReturn(false);
              expect(
                storageRepository.uploadFile(
                  file: file,
                  uploadPath: uploadPath,
                ),
                throwsA(isA<FileNotFoundFailure>()),
              );
            },
          );

          test(
            'throws FileUploadFailure '
            'when upload fails',
            () async {
              final file = MockFile();
              when(file.existsSync).thenReturn(true);
              when(() => uploadTask.whenComplete(any())).thenThrow(Exception());
              expect(
                storageRepository.uploadFile(
                  file: file,
                  uploadPath: uploadPath,
                ),
                throwsA(isA<FileUploadFailure>()),
              );
            },
          );
        },
      );

      group(
        'deleteFile',
        () {
          test(
            'calls refFromUrl and delete '
            'when deleteFile is called with a valid url',
            () async {
              final ref = MockReference();
              const url = 'https://test.com/path';
              when(() => firebaseStorage.refFromURL(url)).thenAnswer((_) => ref);
              when(ref.delete).thenAnswer((_) async {});
              await storageRepository.deleteFile(url: url);
              verify(ref.delete).called(1);
            },
          );

          test(
            'throws InvalidUrlFailure '
            'when deleteFile is called with an invalid url',
            () async {
              final ref = MockReference();

              const url = '/invalid/test.com/path';
              when(() => firebaseStorage.refFromURL(url)).thenAnswer((_) => ref);
              when(ref.delete).thenAnswer((_) async {});

              expect(
                storageRepository.deleteFile(url: url),
                throwsA(isA<InvalidUrlFailure>()),
              );

              verifyNever(() => firebaseStorage.refFromURL(url));
              verifyNever(ref.delete);
            },
          );

          test(
            'throws FileDeleteFailure '
            'when refFromURL fails',
            () async {
              final ref = MockReference();
              const url = 'https://test.com/path';
              when(() => firebaseStorage.refFromURL(url)).thenThrow(Exception());
              when(ref.delete).thenAnswer((_) async {});

              expect(
                storageRepository.deleteFile(url: url),
                throwsA(isA<FileDeleteFailure>()),
              );

              verifyNever(ref.delete);
            },
          );

          test(
            'throws FileDeleteFailure '
            'when delete fails',
            () async {
              final ref = MockReference();
              const url = 'https://test.com/path';
              when(() => firebaseStorage.refFromURL(url)).thenAnswer((_) => ref);
              when(ref.delete).thenThrow(Exception());

              expect(
                storageRepository.deleteFile(url: url),
                throwsA(isA<FileDeleteFailure>()),
              );
            },
          );
        },
      );
    },
  );
}
