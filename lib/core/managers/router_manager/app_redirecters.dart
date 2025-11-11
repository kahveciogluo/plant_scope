import '../../../app_export.dart';

class AppRedirecters {
  static String? onboardingRedirect(BuildContext context, GoRouterState state) {
    final userManager = ml<UserManager>();
    final isOnboardingCompleted = userManager.onboardingCompleted;
    if (!isOnboardingCompleted) {
      return AppRouter.onboarding;
    }
    return null;
  }
}
