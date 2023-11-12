// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:database_repository/database_repository.dart';

import 'package:firebase_core/firebase_core.dart';
// We actually do depend on this package, false lint
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference<T> extends Mock
    implements CollectionReference<T> {}

class MockDocumentReference<T> extends Mock implements DocumentReference<T> {}

class MockDocumentSnapshot<T> extends Mock implements DocumentSnapshot<T> {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

class MockHiveBox extends Mock implements Box<dynamic> {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Box<dynamic> hiveBox;
  late DatabaseRepository databaseRepository;

  late FirebaseFirestore firestore;
  late CollectionReference<Map<String, dynamic>> usersCollection;
  late DocumentReference<Map<String, dynamic>> userDocument;

  const userId = 'userId';

  group('DatabaseRepository', () {
    setUp(() async {
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

      firestore = MockFirebaseFirestore();

      usersCollection = MockCollectionReference<Map<String, dynamic>>();
      userDocument = MockDocumentReference<Map<String, dynamic>>();

      when(() => firestore.collection(DatabaseRepository.kUsersCollection))
          .thenReturn(usersCollection);
      when(() => usersCollection.doc(userId)).thenReturn(userDocument);

      hiveBox = MockHiveBox();
      when(() => hiveBox.close()).thenAnswer((_) async {
        return;
      });
      when(() => hiveBox.name).thenReturn(DatabaseRepository.kDefaultHiveBox);
      when(() => hiveBox.isOpen).thenReturn(true);
      databaseRepository = DatabaseRepository.mockable(
        firestore: firestore,
        hiveBox: hiveBox,
      );

      await databaseRepository.initialize();
    });

    tearDown(() async {
      await databaseRepository.dispose();
    });

    test(
      'creates FirebaseFirestore and Hive Box '
      'when not injected',
      () {
        expect(DatabaseRepository.new, isNot(throwsException));
      },
    );

    group('UserExtension.fromDocumentSnapshot', () {
      test(
        'returns User.empty '
        'when snapshot.data() is null',
        () {
          final snapshot = MockDocumentSnapshot<Object?>();
          when(() => snapshot.exists).thenReturn(true);
          when(snapshot.data).thenReturn(null);

          expect(
            UserExtension.fromDocumentSnapshot(snapshot),
            equals(User.empty),
          );
        },
      );

      test(
        'returns User.empty '
        'when snapshot.exists is false',
        () {
          final snapshot = MockDocumentSnapshot<Object?>();
          when(() => snapshot.exists).thenReturn(false);
          when(snapshot.data).thenReturn(<String, dynamic>{});

          expect(
            UserExtension.fromDocumentSnapshot(snapshot),
            equals(User.empty),
          );
        },
      );

      test(
        'returns correct User with correct id '
        'when snapshot.exists is true and snapshot.data() is not null',
        () {
          const user = User(id: userId, email: 'test@test.com');
          final userJson = {
            'email': user.email,
          };
          final snapshot = MockDocumentSnapshot<Object?>();
          when(() => snapshot.exists).thenReturn(true);
          when(() => snapshot.id).thenReturn(user.id!);
          when(snapshot.data).thenReturn(userJson);
          final parsedUser = UserExtension.fromDocumentSnapshot(snapshot);
          expect(parsedUser, user);
        },
      );
    });

    group('ensureUserInitialized', () {
      test(
        'right User is returned without side effects '
        'when user exists in database',
        () async {
          const user = User(id: userId, email: 'test@test.com');
          final userJson = user.toJson();

          final snapshot = MockDocumentSnapshot<Map<String, dynamic>>();
          when(() => snapshot.exists).thenReturn(true);
          when(() => snapshot.id).thenReturn(user.id!);
          when(snapshot.data).thenReturn(userJson);
          when(() => userDocument.get()).thenAnswer(
            (_) async => Future.value(snapshot),
          );
          when(() => userDocument.set(user.toJson())).thenAnswer(
            (_) async => {},
          );

          final result = await databaseRepository.ensureUserInitialized(user);

          expect(result, equals(user));
          verifyNever(() => userDocument.set(user.toJson()));
        },
      );

      test(
        'user is created from auth user and updated to database '
        'when user does not exists in database',
        () async {
          const user = User(
            id: userId,
            email: 'test@test.com',
            photoUrl: 'testUrl',
            displayName: 'tester',
          );

          final snapshot = MockDocumentSnapshot<Map<String, dynamic>>();
          when(() => snapshot.exists).thenReturn(false);

          when(() => userDocument.get())
              .thenAnswer((_) async => Future.value(snapshot));
          when(() => userDocument.set(user.toJson()))
              .thenAnswer((_) async => {});

          final result = await databaseRepository.ensureUserInitialized(user);

          expect(result, equals(user));

          verify(() => userDocument.set(user.toJson())).called(1);
        },
      );
    });

    group('saveUser', () {
      test(
        'user is saved to database '
        'when saveUser is called',
        () async {
          const user = User(
            id: userId,
            email: 'test@test.com',
          );

          when(() => userDocument.set(user.toJson()))
              .thenAnswer((_) async => {});

          await databaseRepository.saveUser(user);

          verify(() => userDocument.set(user.toJson())).called(1);
        },
      );

      test(
        'user is returned unmodified '
        'when saveUser is called',
        () async {
          const user = User(
            id: userId,
            email: 'test@test.com',
          );

          when(() => userDocument.set(user.toJson()))
              .thenAnswer((_) async => {});

          final result = await databaseRepository.saveUser(user);

          expect(result, equals(user));
        },
      );
    });

    group('notification permission prompts', () {
      test(
        'hasPromptedNotificationPermissions returns false '
        'when hive box returns false',
        () {
          when(
            () => hiveBox.get(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              defaultValue: false,
            ),
          ).thenReturn(false);
          final result =
              databaseRepository.hasPromptedNotificationPermissions();
          expect(result, false);
        },
      );

      test(
        'hasPromptedNotificationPermissions returns true '
        'when hive box returns true',
        () {
          when(
            () => hiveBox.get(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              defaultValue: false,
            ),
          ).thenReturn(true);
          final result =
              databaseRepository.hasPromptedNotificationPermissions();
          expect(result, true);
        },
      );

      test(
        'put is called on hivebox with value true '
        'when setNotificationPermissionsPrompted is called with prompted:true ',
        () async {
          when(
            () => hiveBox.put(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              true,
            ),
          ).thenAnswer((_) async {
            return;
          });

          await databaseRepository.setNotificationPermissionsPrompted();
          verify(
            () => hiveBox.put(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              true,
            ),
          ).called(1);
        },
      );
      test(
        'put is called on hivebox with value false '
        'when setNotificationPermissionsPrompted is called with prompted:false ',
        () async {
          when(
            () => hiveBox.put(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              false,
            ),
          ).thenAnswer((_) async {
            return;
          });

          await databaseRepository.setNotificationPermissionsPrompted(
            prompted: false,
          );
          verify(
            () => hiveBox.put(
              DatabaseRepository.kNotificationsPermissionsPrompted,
              false,
            ),
          ).called(1);
        },
      );
    });
  });
}
