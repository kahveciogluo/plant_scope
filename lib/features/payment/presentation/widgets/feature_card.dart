import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/payment/domain/entities/feature_entity.dart';

class FeatureCard extends StatelessWidget {
  final FeatureEntity feature;

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.45,
      height: 140,
      decoration: BoxDecoration(
        color: context.colors.surface.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.colors.onSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              feature.icon,
              color: Colors.white,
              size: 28,
            ).allPadding(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                feature.title ?? '',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                feature.subtitle ?? '',
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withAlpha(180),
                ),
              ).topPadding(4),
            ],
          ),
        ],
      ).allPadding(16),
    );
  }
}
