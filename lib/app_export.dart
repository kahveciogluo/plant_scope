// Core exports
export 'core/constants/app_constants.dart';
export 'core/errors/exceptions.dart';
export 'core/errors/failures.dart';
export 'core/managers/network_manager/api_constants.dart';
export 'core/managers/network_manager/endpoints.dart';
export 'core/managers/network_manager/api_interceptor.dart';
export 'core/managers/network_manager/network_manager.dart';
export 'core/managers/user_manager/user_manager.dart';
export 'core/managers/storage_manager/storage_manager.dart';
export 'core/managers/storage_manager/storage_key.dart';
export 'core/managers/locale_manager/locale_manager.dart';
export 'core/managers/global_overlay_manager/global_overlay_manager.dart';
export 'core/managers/global_overlay_manager/global_overlay_type.dart';
export 'core/managers/global_overlay_manager/popup_type.dart';
export 'core/managers/router_manager/app_router.dart';
export 'core/managers/theme_manager/app_colors.dart';
export 'core/managers/theme_manager/app_text_theme.dart';
export 'core/managers/theme_manager/theme_manager.dart';
export 'core/usecases/usecase.dart';

// External Package Exports
export 'package:dio/dio.dart';
export 'package:dartz/dartz.dart' hide State;
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:equatable/equatable.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:cached_network_image/cached_network_image.dart';

// Flutter Exports
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

// Logger
export 'package:logger/logger.dart';

// DI
export 'injection_container.dart';

// Extensions
export 'core/extensions/context_extension.dart';
export 'core/extensions/padding_extension.dart';
export 'core/extensions/date_time_extension.dart';
export 'core/managers/router_manager/router_extension.dart';

// Generated Assets
export 'core/gen/assets.gen.dart';
export 'core/managers/locale_manager/locale_keys.g.dart';
