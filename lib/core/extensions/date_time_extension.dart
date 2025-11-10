import 'package:plant_scope/app_export.dart';

extension DateTimeStringExtension on DateTime {
  String get greetingMessage {
    final hour = this.hour;
    if (hour < 12) {
      return LocaleKeys.greetings_good_morning.tr();
    } else if (hour < 18) {
      return LocaleKeys.greetings_good_afternoon.tr();
    } else if (hour < 21) {
      return LocaleKeys.greetings_good_evening.tr();
    } else {
      return LocaleKeys.greetings_good_night.tr();
    }
  }
}
