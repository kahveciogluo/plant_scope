import 'dart:io';

import 'package:plant_scope/app_export.dart';

extension ContextExtension on BuildContext {
  double get kHomeIndicatorHeight =>
      Platform.isAndroid ? 0 : MediaQuery.of(this).viewPadding.bottom;

  double get kKeyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;
}
