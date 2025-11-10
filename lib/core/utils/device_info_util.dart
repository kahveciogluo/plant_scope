import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:plant_scope/app_export.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoUtil {
  DeviceInfoUtil._();
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static const AndroidId _androidPlugin = AndroidId();
  static final Logger _logger = Logger();

  static Future<String> getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
        return androidInfo.model;
      } else {
        IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        return iosInfo.utsname.machine;
      }
    } catch (e) {
      _logger.e('Failed to get device name: $e');
      return 'Unknown Device Name';
    }
  }

  static Future<String> getDeviceId() async {
    String? deviceId;
    try {
      if (Platform.isAndroid) {
        deviceId = await _androidPlugin.getId();
      } else if (Platform.isIOS) {
        final storageManager = ml<StorageManager>();
        deviceId = await storageManager.read(key: StorageKey.deviceId);
        if (deviceId == null) {
          final newDeviceId = const Uuid().v4();
          await storageManager.write(
            key: StorageKey.deviceId,
            value: newDeviceId,
          );
          deviceId = newDeviceId;
        }
      }
      return deviceId ?? const Uuid().v4();
    } catch (e) {
      _logger.e('Failed to get device id: $e');
      return 'Unknown Device Id';
    }
  }
}
