import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';
import 'package:model/model.dart';
import 'package:path_provider/path_provider.dart';

part 'extensions.dart';

/// {@template database_repository}
/// A repository which manages all interactions with remote databases.
/// {@endtemplate}
class DatabaseRepository extends Repository {
  /// {@macro database_repository}
  DatabaseRepository({
    FirebaseApp? firebaseApp,
    Box<dynamic>? hiveBox,
  })  : _firestore =
            FirebaseFirestore.instanceFor(app: firebaseApp ?? Firebase.app()),
        _hiveBox = hiveBox;

  /// {@macro database_repository}
  DatabaseRepository.mockable({
    required FirebaseFirestore firestore,
    required Box<dynamic> hiveBox,
  })  : _firestore = firestore,
        _hiveBox = hiveBox;

  late final FirebaseFirestore _firestore;

  /// The local ligthweigth database.
  Box<dynamic>? _hiveBox;

  /// The collection name where users are stored in database.
  @visibleForTesting
  static const kUsersCollection = 'users';

  /// The key where the notification permissions have been prompted is stored in the local database.
  @visibleForTesting
  static const kNotificationsPermissionsPrompted =
      'push_notification_permissions_prompted';

  /// The default hive box name.
  @visibleForTesting
  static const kDefaultHiveBox = 'database_repository';

  /// Initializes the database repository, more specifically the hive database. IMPORTANT: This method should be called before any other method.
  @override
  Future<void> initialize() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    final name = _hiveBox?.name ?? kDefaultHiveBox;

    if (!Hive.isBoxOpen(name)) {
      _hiveBox = await Hive.openBox<dynamic>(name);
    }

    return super.initialize();
  }

  /// Gets the [HideAndSeekEvent] with the given [sessionId].
  Stream<List<HideAndSeekEvent>> getHideAndSeekEvents(String sessionId) {
    return FirebaseFirestore.instance
        .collection('hide-and-seek-events')
        .doc(sessionId)
        .collection('events')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => HideAndSeekEvent.fromJson(doc.data()))
              .toList(),
        );
  }

  /// Adds the given [event] to the [HideAndSeekEvent]s with the given [sessionId].
  Future<void> addHideAndSeekEvent(HideAndSeekEvent event, String sessionId) {
    return FirebaseFirestore.instance
        .collection('hide-and-seek-events')
        .doc(sessionId)
        .collection('events')
        .add(event.toJson());
  }

  /// Creates a new session with the given [user] as the creator.
  Future<String> createSession(User user) async {
    final doc = await FirebaseFirestore.instance.collection('game-states').add(
          GameState.hideAndSeek(
            creatorId: user.id!,
          ).toJson(),
        );

    return doc.id;
  }

  /// Gets the [GameState] with the given [sessionId].
  Stream<GameState> getGameState(String sessionId) {
    return FirebaseFirestore.instance
        .collection('game-states')
        .doc(sessionId)
        .snapshots()
        .map(
          (snapshot) => GameState.fromData(snapshot.id, snapshot.data()!),
        );
  }

  /// Updates the [HideAndSeekPlayerData] with the given [data] and [sessionId].
  Future<void> updatePlayerData(
    HideAndSeekPlayerData data,
    String sessionId,
  ) async {
    final gameStateRaw = await FirebaseFirestore.instance
        .collection('game-states')
        .doc(sessionId)
        .get();

    final gameState = GameState.fromData(sessionId, gameStateRaw.data()!);

    final playerData = gameState.playerData;

    final index =
        playerData.indexWhere((element) => element.playerId == data.playerId);

    if (index == -1) {
      playerData.add(data);
    } else {
      playerData[index] = data;
    }

    return updateGameState(gameState.copyWith(playerData: playerData));
  }

  /// Joins the user to the session
  Future<void> joinSession(String sessionId, User user) async {
    final gameStateRaw = await FirebaseFirestore.instance
        .collection('game-states')
        .doc(sessionId)
        .get();

    final gameState = GameState.fromData(sessionId, gameStateRaw.data()!);

    final playerData = gameState.playerData;

    final index = playerData.indexWhere(
      (element) => element.playerId == user.id,
    );

    final data = HideAndSeekPlayerData(
      playerId: user.id!,
      role: HideAndSeekRole.hider,
    );

    if (index == -1) {
      playerData.add(
        data,
      );
    } else {
      playerData[index] = data;
    }
  }

  /// Updates the [GameState] with the given [gameState].
  Future<void> updateGameState(GameState gameState) {
    return FirebaseFirestore.instance
        .collection('game-states')
        .doc(gameState.sessionId)
        .update(gameState.toJson());
  }

  /// Closes the hive database.
  @override
  Future<void> dispose() async {
    await _hiveBox?.close();

    return super.dispose();
  }

  /// Ensures that the given [user]s data exists in the database. If the user does not exist, it is created.
  ///
  /// Returns the [User] object from the database.
  Future<User> ensureUserInitialized(User user) async {
    if (user.isUnAuthenticated) return user;

    /// Tries to get the user data from firestore.
    final doc =
        await _firestore.collection(kUsersCollection).doc(user.id).get();
    final firebaseUser = UserExtension.fromDocumentSnapshot(doc);

    if (firebaseUser.isEmpty) {
      /// User does not exist in database, so it shall be created.

      return saveUser(user);
    }

    return firebaseUser;
  }

  /// Saves the given [user] to the database.
  Future<User> saveUser(User user) async {
    await _firestore
        .collection(kUsersCollection)
        .doc(user.id)
        .set(user.toJson());

    return user;
  }

  /// Whether the notification permissions have been asked on the current device or not.
  bool hasPromptedNotificationPermissions() {
    assert(
      _hiveBox?.isOpen ?? false,
      'DatabaseRepository.initialize() must be called before any other method.',
    );

    return _hiveBox!.get(kNotificationsPermissionsPrompted, defaultValue: false)
        as bool;
  }

  /// Sets whether the notification permissions have been asked on the current device or not.
  Future<void> setNotificationPermissionsPrompted({
    bool prompted = true,
  }) async {
    assert(
      _hiveBox?.isOpen ?? false,
      'DatabaseRepository.initialize() must be called before any other method.',
    );

    return _hiveBox!.put(kNotificationsPermissionsPrompted, prompted);
  }
}
