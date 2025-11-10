import 'package:flutter/foundation.dart';

import '../../../app_export.dart';

class NetworkManager {
  late final Dio _dio;
  late final ApiInterceptor _apiInterceptor;
  final UserManager userManager;
  final LocaleManager localeManager;

  NetworkManager({required this.userManager, required this.localeManager}) {
    _apiInterceptor = ApiInterceptor(
      userManager: userManager,
      localeManager: localeManager,
    );

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeout,
        ),
      ),
    )..interceptors.add(_apiInterceptor);

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          error: true,
          responseHeader: true,
          responseBody: true,
          request: true,
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  Future<void> initializeInterceptor() async => _apiInterceptor.initialize();

  Dio get dio => _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
