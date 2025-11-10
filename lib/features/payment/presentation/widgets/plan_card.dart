import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/payment/domain/entities/plan_entity.dart';
import 'package:plant_scope/shared/buttons/app_radio_button.dart';

class PlanCard extends StatelessWidget {
  final PlanEntity plan;
  final int currentIndex, planIndex;

  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.plan,
    required this.currentIndex,
    required this.planIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == planIndex;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(isSelected ? 150 : 100),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.onPrimary.withAlpha(30),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                AppRadioButton(isSelected: isSelected).rightPadding(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.title ?? '',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      plan.subtitle ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withAlpha(180),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Badge
          if (plan.badge != null) ...[
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.secondary
                    : context.colors.onSurface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                plan.badge!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
