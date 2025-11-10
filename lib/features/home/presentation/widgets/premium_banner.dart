import 'package:plant_scope/app_export.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF24201A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Badge(
                backgroundColor: context.colors.error,
                smallSize: 16,
                offset: const Offset(6, -6),
                label: Text(
                  "1",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: FaIcon(
                  FontAwesomeIcons.solidEnvelope,
                  color: const Color(0xFFD4AF37),
                  size: 30,
                ),
              ).rightPadding(16),
              // Text content
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.premium_banner_title.tr(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: const Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    LocaleKeys.premium_banner_subtitle.tr(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFD4AF37).withAlpha(180),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Arrow icon
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFD4AF37),
            size: 16,
          ),
        ],
      ),
    );
  }
}
