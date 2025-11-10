import 'package:plant_scope/app_export.dart';

class ThemeManager {
  ThemeManager._();

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        tertiary: AppColors.tertiaryLight,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
        onPrimary: AppColors.textOnPrimaryLight,
        onSecondary: AppColors.textOnPrimaryLight,
        onSurface: AppColors.textPrimaryLight,
        onError: AppColors.textOnPrimaryLight,
        outline: AppColors.dividerLight,
      ),
      textTheme: AppTextTheme.lightTextTheme,
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        tertiary: AppColors.tertiaryDark,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
        onPrimary: AppColors.textOnPrimaryDark,
        onSecondary: AppColors.textOnPrimaryDark,
        onSurface: AppColors.textPrimaryDark,
        onError: AppColors.textOnPrimaryDark,
        outline: AppColors.dividerDark,
      ),
      textTheme: AppTextTheme.darkTextTheme,
    );
  }
}
