import '../../../app_export.dart';

class UserManager {
  final StorageManager _storageManager;

  UserManager(this._storageManager);

  String? _token;
  bool _onboardingCompleted = false;

  String? get token => _token;
  bool get onboardingCompleted => _onboardingCompleted;
  bool get isLoggedIn => _token != null;

  Future<void> initialize() async {
    _token = await _storageManager.read(key: StorageKey.userToken);

    final onboardingString = await _storageManager.read(
      key: StorageKey.userOnboardingCompleted,
    );
    _onboardingCompleted = onboardingString == 'true';
  }

  Future<void> setToken(String token) async {
    _token = token;
    await _storageManager.write(key: StorageKey.userToken, value: token);
  }

  Future<void> setOnboardingCompleted(bool completed) async {
    _onboardingCompleted = completed;
    await _storageManager.write(
      key: StorageKey.userOnboardingCompleted,
      value: completed.toString(),
    );
  }

  Future<void> clear() async {
    _token = null;
    _onboardingCompleted = false;
    await _storageManager.clearAll();
  }

  Future<void> logout() async {
    await clear();
  }
}
