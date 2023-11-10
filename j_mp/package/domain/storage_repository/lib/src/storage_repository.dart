import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mankeli_core/mankeli_core.dart';
import 'package:meta/meta.dart';

part 'failures.dart';

/// {@template storage_repository}
/// A repository which manages all interactions with remote file storage.
/// {@endtemplate}
class StorageRepository extends Repository {
  /// {@macro storage_repository}
  StorageRepository({
    FirebaseApp? firebaseApp,
  }) : _storage =
            FirebaseStorage.instanceFor(app: firebaseApp ?? Firebase.app());

  /// {@macro storage_repository}
  @visibleForTesting
  StorageRepository.mockable({
    required FirebaseStorage storage,
  }) : _storage = storage;

  late final FirebaseStorage _storage;

  /// This function uploads the given local `file` to cloud storage.
  /// If upload is successfull, returns the url of the uploaded file. Otherwise.
  /// An optional `uploadPath` can be provided to create proper folder structure to cloud storage.
  /// If `uploadPath` is not provided, the file will be uploaded to `/uploads`.
  /// Optional `metadata` can also be provided for the file.
  ///
  /// Throws [FileUploadFailure] if the file upload fails.
  /// Throws [FileNotFoundFailure] if the given `file` is not found
  Future<String> uploadFile({
    required File file,
    String? uploadPath,
    Map<String, String>? metadata,
  }) async {
    try {
      if (!file.existsSync()) {
        throw FileNotFoundFailure();
      }
      final meta = SettableMetadata(
        cacheControl: 'max-age=60',
        customMetadata: metadata,
      );

      final milliseconds = DateTime.now().millisecondsSinceEpoch;
      uploadPath ??= 'uploads/$milliseconds';
      final uploadTask = _storage.ref().child(uploadPath).putFile(file, meta);
      final snapshot = await uploadTask.whenComplete(() {
        return;
      });

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      if (e is FileNotFoundFailure) rethrow;
      throw FileUploadFailure();
    }
  }

  /// This function deletes the file in the given `url` from cloud storage
  ///
  /// Throws [FileDeleteFailure] if the file delete fails.
  /// Throws [InvalidUrlFailure] if the given `url` is not valid
  Future<void> deleteFile({
    required String url,
  }) async {
    try {
      if (!Uri.parse(url).isAbsolute) {
        throw InvalidUrlFailure(url);
      }
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      if (e is InvalidUrlFailure) rethrow;
      throw FileDeleteFailure();
    }
  }
}
