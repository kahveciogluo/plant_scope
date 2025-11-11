import 'package:shared_preferences/shared_preferences.dart';
import 'storage_key.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._internal();
  factory StorageManager() => _instance;
  StorageManager._internal();

  SharedPreferences? _prefs;

  Future<void> _ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> write({required StorageKey key, required String value}) async {
    try {
      await _ensureInitialized();
      await _prefs!.setString(key.name, value);
    } catch (e) {
      throw StorageException('Failed to write to storage: $e');
    }
  }

  Future<String?> read({required StorageKey key}) async {
    try {
      await _ensureInitialized();
      return _prefs!.getString(key.name);
    } catch (e) {
      throw StorageException('Failed to read from storage: $e');
    }
  }

  Future<void> delete({required StorageKey key}) async {
    try {
      await _ensureInitialized();
      await _prefs!.remove(key.name);
    } catch (e) {
      throw StorageException('Failed to delete from storage: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      await _ensureInitialized();
      await _prefs!.clear();
    } catch (e) {
      throw StorageException('Failed to clear storage: $e');
    }
  }

  Future<bool> containsKey({required StorageKey key}) async {
    try {
      await _ensureInitialized();
      return _prefs!.containsKey(key.name);
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> readAll() async {
    try {
      await _ensureInitialized();
      final keys = _prefs!.getKeys();
      final Map<String, dynamic> result = {};
      for (var key in keys) {
        result[key] = _prefs!.get(key);
      }
      return result;
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
