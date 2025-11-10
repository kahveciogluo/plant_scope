import '../../../app_export.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._internal();
  factory LocaleManager() => _instance;
  LocaleManager._internal();

  // Supported Locales
  static const Locale trLocale = Locale('tr', 'TR');
  static const Locale enLocale = Locale('en', 'US');

  // Configuration
  static const bool useOnlyLangCode = true;
  static const String path = 'assets/langs';
  static const Locale fallbackLocale = enLocale;

  List<Locale> get supportedLocales => [enLocale, trLocale];

  Locale get currentLocale {
    final context = AppRouter.navigatorKey.currentContext;
    return context != null ? context.locale : fallbackLocale;
  }
}
