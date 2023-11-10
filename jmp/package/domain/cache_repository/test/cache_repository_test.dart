import 'dart:io' as io;

import 'package:cache_repository/cache_repository.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDefaultCacheManager extends Mock implements DefaultCacheManager {}

class MockFile extends Mock implements File {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CacheRepository', () {
    test(
        'can read, write and delete from in memory cache '
        'when cacheSessionValue, getSessionValue and deleteSessionValue are called', () {
      final cache = CacheRepository(cacheManager: MockDefaultCacheManager());
      const key = 'testKey';
      const value = 'testValue';

      cache.cacheSessionValue(key, value);
      expect(cache.getSessionValue<String>(key), equals(value));

      cache.deleteSessionValue(key);

      expect(cache.getSessionValue<dynamic>(key), isNull);
    });

    test(
        'downloads a file through DefaultCacheManager '
        'when downloadFile is called', () async {
      final mockCacheManager = MockDefaultCacheManager();
      final mockFile = MockFile();
      final cache = CacheRepository(cacheManager: mockCacheManager);
      const url = 'testUrl';

      when(() => mockCacheManager.getSingleFile(url)).thenAnswer((_) => Future.value(mockFile));

      // ignore: omit_local_variable_types
      final io.File file = await cache.downloadFile(url);

      expect(file, equals(mockFile));

      verify(() => mockCacheManager.getSingleFile(url)).called(1);
    });
  });
}
