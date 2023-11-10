part of 'storage_repository.dart';
// ignore_for_file: prefer-match-file-name

/// {@template file_upload_failure}
/// Thrown if the file upload fails.
/// {@endtemplate}
class FileUploadFailure implements Exception {
  /// {@macro file_upload_failure}
  FileUploadFailure() : message = 'File upload failed';

  /// The message of the failure.
  final String message;
}

/// {@template file_upload_failure}
/// Thrown if there is no file in the given file path
/// {@endtemplate}
class FileNotFoundFailure implements Exception {
  /// {@macro file_upload_failure}
  FileNotFoundFailure() : message = 'File cannot be found from the given file path';

  /// The message of the failure.
  final String message;
}

/// {@template file_delete_failure}
/// Thrown if the file delete fails.
/// {@endtemplate}
class FileDeleteFailure implements Exception {
  /// {@macro file_delete_failure}
  FileDeleteFailure() : message = 'File delete failed';

  /// The message of the failure.
  final String message;
}

/// {@template invalid_url_failure}
/// Thrown if the url is invalid.
class InvalidUrlFailure implements Exception {
  /// {@macro invalid_url_failure}
  InvalidUrlFailure(this.url) : message = 'Invalid url: $url';

  /// The url of the request that was invalid
  final String url;

  /// The message of the failure.
  final String message;
}
