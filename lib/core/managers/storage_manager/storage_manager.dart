import '../../../app_export.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._internal();
  factory StorageManager() => _instance;
  StorageManager._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true, // Api 23+ lar için
      resetOnError: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  Future<void> write({required StorageKey key, required String value}) async {
    try {
      await _storage.write(key: key.name, value: value);
    } catch (e) {
      throw StorageException('Failed to write to storage: $e');
    }
  }

  Future<String?> read({required StorageKey key}) async {
    try {
      return await _storage.read(key: key.name);
    } catch (e) {
      throw StorageException('Failed to read from storage: $e');
    }
  }

  Future<void> delete({required StorageKey key}) async {
    try {
      await _storage.delete(key: key.name);
    } catch (e) {
      throw StorageException('Failed to delete from storage: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw StorageException('Failed to clear storage: $e');
    }
  }

  Future<bool> containsKey({required StorageKey key}) async {
    try {
      final value = await _storage.read(key: key.name);
      return value != null;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      throw StorageException('Failed to read all from storage: $e');
    }
  }
}

class StorageException implements Exception {
  final String message;
  StorageException(this.message);

  @override
  String toString() => 'StorageException: $message';
}
