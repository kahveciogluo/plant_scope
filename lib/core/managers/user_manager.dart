import '../../app_export.dart';

class UserManager {
  final StorageManager _storageManager;

  UserManager(this._storageManager);

  String? _token;
  Map<String, dynamic>? _userData;

  String? get token => _token;
  Map<String, dynamic>? get userData => _userData;
  bool get isLoggedIn => _token != null;

  Future<void> initialize() async {
    _token = await _storageManager.read(key: StorageKey.userToken);
    final userDataString = await _storageManager.read(key: StorageKey.userData);
    if (userDataString != null) {
      // _userData = jsonDecode(userDataString);
    }
  }

  Future<void> setToken(String token) async {
    _token = token;
    await _storageManager.write(key: StorageKey.userToken, value: token);
  }

  Future<void> setUserData(Map<String, dynamic> data) async {
    _userData = data;
    // await _storageManager.write(
    //   key: StorageKey.userData,
    //   value: jsonEncode(data),
    // );
  }

  Future<void> clear() async {
    _token = null;
    _userData = null;
    await _storageManager.delete(key: StorageKey.userToken);
    await _storageManager.delete(key: StorageKey.userData);
  }

  Future<void> logout() async {
    await clear();
  }
}
