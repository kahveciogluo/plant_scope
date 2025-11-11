import 'package:flutter/gestures.dart';
import 'package:plant_scope/app_export.dart';

class AgreementsWidget extends StatelessWidget {
  const AgreementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: _buildText(context)),
      textAlign: TextAlign.center,
    );
  }
}

List<TextSpan> _buildText(BuildContext context) {
  var agreementText = LocaleKeys.onboarding_agreement_all_text.tr();
  var termsOfUse = LocaleKeys.onboarding_agreement_terms_of_use.tr();
  var privacyPolicy = LocaleKeys.onboarding_agreement_privacy_policy.tr();

  List<TextSpan> allText = [];

  final parts = agreementText.split(
    RegExp(r'\{terms_of_use\}|\{privacy_policy\}'),
  );
  final matches = RegExp(
    r'\{terms_of_use\}|\{privacy_policy\}',
  ).allMatches(agreementText).toList();

  for (var i = 0; i < parts.length; i++) {
    if (parts[i].isNotEmpty) {
      allText.add(
        TextSpan(text: parts[i], style: context.textTheme.labelLarge),
      );
    }

    if (i < matches.length) {
      final match = matches[i].group(0);
      if (match == '{terms_of_use}') {
        allText.add(
          TextSpan(
            text: termsOfUse,
            style: context.textTheme.labelLarge?.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: (TapGestureRecognizer()
              ..onTap = () => context.pushNamed(
                AppRouter.appWebView.asPageName,
                queryParameters: {
                  'url': AppConstants.termsOfUseUrl,
                  'pageTitle': termsOfUse,
                },
              )),
          ),
        );
      } else if (match == '{privacy_policy}') {
        allText.add(
          TextSpan(
            text: privacyPolicy,
            style: context.textTheme.labelLarge?.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: (TapGestureRecognizer()
              ..onTap = () => context.pushNamed(
                AppRouter.appWebView.asPageName,
                queryParameters: {
                  'url': AppConstants.privacyPolicyUrl,
                  'pageTitle': privacyPolicy,
                },
              )),
          ),
        );
      }
    }
  }

  return allText;
}
