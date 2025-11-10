import 'package:plant_scope/app_export.dart';

extension OnboardingWidgets on int {
  // Image
  AssetGenImage get getOnboardingImage {
    switch (this) {
      case 0:
        return Assets.images.ob1Bg;
      case 1:
        return Assets.images.ob2Bg;
      case 2:
        return Assets.images.ob3Bg;
      default:
        return Assets.images.ob1Bg;
    }
  }

  // Button Text
  String get getOnboardingButtonText {
    return this == 0
        ? LocaleKeys.onboarding_get_started_button.tr()
        : LocaleKeys.onboarding_continue_button.tr();
  }

  // Title and SubTitle
  List<TextSpan> get getOnboardingTitleSpans {
    switch (this) {
      case 0:
        return [
          TextSpan(text: LocaleKeys.onboarding_ob1_title_1.tr()),
          TextSpan(
            text: LocaleKeys.onboarding_ob1_title_2.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ];
      case 1:
        return [
          TextSpan(text: LocaleKeys.onboarding_ob2_title_1.tr()),
          TextSpan(
            text: LocaleKeys.onboarding_ob2_title_2.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: LocaleKeys.onboarding_ob2_title_3.tr()),
        ];
      case 2:
        return [
          TextSpan(text: LocaleKeys.onboarding_ob3_title_1.tr()),
          TextSpan(
            text: LocaleKeys.onboarding_ob3_title_2.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ];
      default:
        return [];
    }
  }
}
