import 'dart:io';

import 'package:plant_scope/core/utils/app_info_util.dart';
import 'package:plant_scope/core/utils/device_info_util.dart';

import '../../../app_export.dart';

class ApiInterceptor extends Interceptor {
  final UserManager userManager;
  final LocaleManager localeManager;

  String? _cachedPlatform;
  String? _cachedDeviceId;
  String? _cachedDeviceName;
  String? _cachedAppVersion;

  ApiInterceptor({required this.userManager, required this.localeManager});

  Future<void> initialize() async {
    _cachedPlatform = Platform.isAndroid ? 'android' : 'ios';
    _cachedDeviceId = await DeviceInfoUtil.getDeviceId();
    _cachedDeviceName = await DeviceInfoUtil.getDeviceName();
    _cachedAppVersion = await AppInfoUtil.getAppVersion();
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Common headers
    final accessToken = userManager.token;
    final currentLocale = localeManager.currentLocale.languageCode;

    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (_cachedPlatform != null) 'X-Platform': _cachedPlatform,
      if (_cachedDeviceId != null) 'X-Device-ID': _cachedDeviceId,
      if (_cachedDeviceName != null) 'X-Device-Name': _cachedDeviceName,
      if (_cachedAppVersion != null) 'X-App-Version': _cachedAppVersion,
      'Accept-Language': currentLocale,
      if (accessToken != null && accessToken.isNotEmpty)
        'Authorization': 'Bearer $accessToken',
    });

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle specific error cases

    // Unauthorized - clear token and redirect to login
    if (err.response?.statusCode == 401) {
      debugPrint('🔒 Unauthorized - Token expired or invalid');
      userManager.clear();
    }

    handler.next(err);
  }
}
