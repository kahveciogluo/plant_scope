import 'package:plant_scope/app_export.dart';

class PaywallFooterLinks extends StatelessWidget {
  final VoidCallback onRestorePurchases;
  const PaywallFooterLinks({super.key, required this.onRestorePurchases});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.pushNamed(
              AppRouter.appWebView.asPageName,
              queryParameters: {
                'url': AppConstants.termsOfUseUrl,
                'pageTitle': LocaleKeys.onboarding_agreement_terms_of_use.tr(),
              },
            );
          },
          child: Text(
            LocaleKeys.onboarding_agreement_terms_of_use.tr(),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.surface.withAlpha(180),
              fontSize: 12,
            ),
          ),
        ),
        Text(
          ' • ',
          style: TextStyle(color: context.colors.surface.withAlpha(180)),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(
              AppRouter.appWebView.asPageName,
              queryParameters: {
                'url': AppConstants.privacyPolicyUrl,
                'pageTitle': LocaleKeys.onboarding_agreement_privacy_policy
                    .tr(),
              },
            );
          },
          child: Text(
            LocaleKeys.onboarding_agreement_privacy_policy.tr(),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.surface.withAlpha(180),
              fontSize: 12,
            ),
          ),
        ),
        Text(
          ' • ',
          style: TextStyle(color: context.colors.surface.withAlpha(180)),
        ),
        TextButton(
          onPressed: onRestorePurchases,
          child: Text(
            LocaleKeys.paywall_restore.tr(),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.surface.withAlpha(180),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
