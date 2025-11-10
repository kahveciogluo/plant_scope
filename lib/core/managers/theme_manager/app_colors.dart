import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ==================== LIGHT THEME COLORS ====================

  // Primary Colors - Light Theme
  static const Color primaryLight = Color(0xFF28AF6E);
  static const Color primaryLightVariant = Color(0xFF60AD5E);
  static const Color primaryLightContainer = Color(0xFFE8F5E9);

  // Secondary Colors - Light Theme
  static const Color secondaryLight = Color(0xFF2CCC80);
  static const Color secondaryLightVariant = Color(0xFFBEF67A);
  static const Color secondaryLightContainer = Color(0xFFF1F8E9);

  // Tertiary Colors - Light Theme
  static const Color tertiaryLight = Color(0xFFBDBDBD);

  // Background Colors - Light Theme
  static const Color backgroundLight = Color(0xFFF6F6F6);
  static const Color surfaceLight = Color(0xFFF6F6F6);
  static const Color surfaceVariantLight = Color(0xFFF6F6F6);

  // Text Colors - Light Theme
  static const Color textPrimaryLight = Color(0xFF13231B);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textTertiaryLight = Color(0xFF9E9E9E);
  static const Color textOnPrimaryLight = Color(0xFFFFFFFF);

  // Border & Divider - Light Theme
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color dividerLight = Color(0xFFBDBDBD);

  // Card - Light Theme
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardElevatedLight = Color(0xFFFAFAFA);

  // Shadow - Light Theme
  static const Color shadowLight = Color(0x1F000000);

  // ==================== DARK THEME COLORS ====================

  // Primary Colors - Dark Theme
  static const Color primaryDark = Color(0xFF66BB6A); // Lighter green for dark
  static const Color primaryDarkVariant = Color(0xFF81C784);
  static const Color primaryDarkContainer = Color(0xFF1B5E20);

  // Secondary Colors - Dark Theme
  static const Color secondaryDark = Color(0xFFA5D6A7); // Lighter for dark
  static const Color secondaryDarkVariant = Color(0xFFC5E1A5);
  static const Color secondaryDarkContainer = Color(0xFF33691E);

  // Tertiary Colors - Dark Theme
  static const Color tertiaryDark = Color(0xFFBDBDBD);

  // Background Colors - Dark Theme
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color surfaceVariantDark = Color(0xFF2C2C2C);

  // Text Colors - Dark Theme
  static const Color textPrimaryDark = Color(0xFFE0E0E0);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textTertiaryDark = Color(0xFF808080);
  static const Color textOnPrimaryDark = Color(0xFF000000);

  // Border & Divider - Dark Theme
  static const Color borderDark = Color(0xFF424242);
  static const Color dividerDark = Color(0xFF616161);

  // Card - Dark Theme
  static const Color cardDark = Color(0xFF2C2C2C);
  static const Color cardElevatedDark = Color(0xFF383838);

  // Shadow - Dark Theme
  static const Color shadowDark = Color(0x3F000000);

  // ==================== SHARED COLORS ====================

  // Status Colors (same for both themes)
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // Plant-specific Colors
  static const Color leaf = Color(0xFF66BB6A);
  static const Color leafDark = Color(0xFF81C784);

  static const Color stem = Color(0xFF8D6E63);
  static const Color stemDark = Color(0xFFA1887F);

  static const Color flower = Color(0xFFFF80AB);
  static const Color flowerDark = Color(0xFFFF4081);

  static const Color soil = Color(0xFF795548);
  static const Color soilDark = Color(0xFF8D6E63);

  // Overlay Colors
  static const Color overlayLight = Color(0x33000000);
  static const Color overlayMedium = Color(0x66000000);
  static const Color overlayDark = Color(0x99000000);

  // Gradient Colors - Light Theme
  static const List<Color> primaryGradientLight = [
    Color(0xFF2E7D32),
    Color(0xFF66BB6A),
  ];

  static const List<Color> secondaryGradientLight = [
    Color(0xFF8BC34A),
    Color(0xFFDCEDC8),
  ];

  // Gradient Colors - Dark Theme
  static const List<Color> primaryGradientDark = [
    Color(0xFF66BB6A),
    Color(0xFF2E7D32),
  ];

  static const List<Color> secondaryGradientDark = [
    Color(0xFFA5D6A7),
    Color(0xFF558B2F),
  ];

  // Special Colors
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Shimmer Colors
  static const Color shimmerBaseLight = Color(0xFFE0E0E0);
  static const Color shimmerHighlightLight = Color(0xFFF5F5F5);

  static const Color shimmerBaseDark = Color(0xFF2C2C2C);
  static const Color shimmerHighlightDark = Color(0xFF383838);
}
