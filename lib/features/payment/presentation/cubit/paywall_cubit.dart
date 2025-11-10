import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/payment/domain/entities/feature_entity.dart';
import 'package:plant_scope/features/payment/domain/entities/plan_entity.dart';

part 'paywall_state.dart';

class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit()
    : super(
        PaywallState(
          selectedPlanIndex: 1,
          features: [
            FeatureEntity(
              icon: Icons.panorama_horizontal,
              title: LocaleKeys.paywall_feature_unlimited_title.tr(),
              subtitle: LocaleKeys.paywall_feature_unlimited_subtitle.tr(),
            ),
            FeatureEntity(
              icon: Icons.speed,
              title: LocaleKeys.paywall_feature_faster_title.tr(),
              subtitle: LocaleKeys.paywall_feature_faster_subtitle.tr(),
            ),
            FeatureEntity(
              icon: Icons.speed,
              title: LocaleKeys.paywall_feature_faster_title.tr(),
              subtitle: LocaleKeys.paywall_feature_faster_subtitle.tr(),
            ),
          ],
          plans: [
            PlanEntity(
              title: LocaleKeys.paywall_plan_1_month_title.tr(),
              subtitle: LocaleKeys.paywall_plan_1_month_price.tr(),
            ),
            PlanEntity(
              title: LocaleKeys.paywall_plan_1_year_title.tr(),
              subtitle: LocaleKeys.paywall_plan_1_year_subtitle.tr(),
              badge: LocaleKeys.paywall_plan_1_year_badge.tr(),
            ),
          ],
        ),
      );

  void selectPlan(int index) {
    emit(state.copyWith(selectedPlanIndex: index));
  }

  void subscribe() {}

  void restorePurchases() {}
}
