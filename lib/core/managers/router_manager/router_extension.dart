extension RouterExtension on String {
  String get asPageName => replaceAll('/', '');
}
