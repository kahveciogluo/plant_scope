import 'package:plant_scope/app_export.dart';

class PaywallAppBar extends StatelessWidget {
  const PaywallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        /// Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.paywallBg.image().image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// Gradient Overlay (resim ile container arası geçiş)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  context.colors.onSurface.withOpacity(0.3),
                  context.colors.onSurface,
                ],
                stops: const [0.0, 0.5, 0.85, 1.0],
              ),
            ),
          ),
        ),

        /// Close Button
        Positioned(
          top: kToolbarHeight,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.close, color: context.colors.onPrimary),
            ),
          ),
        ),

        /// Title Banner
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: LocaleKeys.paywall_title_1.tr(),
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.colors.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.paywall_title_2.tr(),
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              LocaleKeys.paywall_subtitle.tr(),
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.onPrimary.withAlpha(100),
                fontWeight: FontWeight.w300,
              ),
            ).topPadding(2),
          ],
        ).horizontalPadding(20).bottomPadding(20),
      ],
    );
  }
}
