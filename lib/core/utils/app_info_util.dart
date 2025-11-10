import 'package:package_info_plus/package_info_plus.dart';
import 'package:plant_scope/app_export.dart';

class AppInfoUtil {
  AppInfoUtil._();
  static final Logger _logger = Logger();

  static Future<String> getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } catch (e) {
      _logger.e('Failed to get app version: $e');
      return 'Unknown Version';
    }
  }
}
