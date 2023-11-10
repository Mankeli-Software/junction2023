import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mankeli_core/mankeli_core.dart';

/// {@template cache_repository}
/// A repository which manages app caches. Uses `flutter_cache_manager` for caching files from the network and in memory cache for caching data for the current session.
/// {@endtemplate}
class CacheRepository extends Repository {
  /// {@macro cache_repository}
  CacheRepository({
    DefaultCacheManager? cacheManager,
    Map<String, dynamic>? memoryCache,
  })  : _cacheManager = cacheManager ?? DefaultCacheManager(),
        _memoryCache = memoryCache ?? {};

  late final DefaultCacheManager _cacheManager;
  late final Map<String, dynamic> _memoryCache;

  /// Returns a file from the cache if it exists, otherwise downloads it from the network, caches it and returns it.
  Future<File> downloadFile(String url) async {
    return _cacheManager.getSingleFile(url);
  }

  /// Removes a file from the cache.
  Future<void> deleteFile(String path) async {
    return _cacheManager.removeFile(path);
  }

  /// Caches a value to be accessible during the current app session.
  void cacheSessionValue<T>(String key, T value) {
    _memoryCache[key] = value;
  }

  /// Gets a value from the current app session cache.
  T? getSessionValue<T>(String key) {
    if (!_memoryCache.containsKey(key)) {
      return null;
    }

    return _memoryCache[key] as T;
  }

  /// Deletes a value from the current app session cache.
  void deleteSessionValue(String key) {
    if (_memoryCache.containsKey(key)) {
      _memoryCache.remove(key);
    }
  }
}
