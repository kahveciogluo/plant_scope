import 'package:plant_scope/features/payment/presentation/widgets/feature_card.dart';
import 'package:plant_scope/features/payment/presentation/widgets/paywall_app_bar.dart';
import 'package:plant_scope/features/payment/presentation/widgets/paywall_footer_links.dart';
import 'package:plant_scope/features/payment/presentation/widgets/plan_card.dart';
import 'package:plant_scope/shared/buttons/app_rounded_button.dart';

import '../cubit/paywall_cubit.dart';
import '../../../../app_export.dart';

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaywallCubit(),
      child: BlocBuilder<PaywallCubit, PaywallState>(
        builder: (context, state) {
          final cubit = context.read<PaywallCubit>();
          return Scaffold(
            backgroundColor: context.colors.onSurface,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  expandedHeight: context.height * 0.3,
                  collapsedHeight: context.height * 0.3,
                  toolbarHeight: context.height * 0.3,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  flexibleSpace: PaywallAppBar(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: context.colors.onSurface,
                    child: Column(
                      children: [
                        /// Feature List
                        SizedBox(
                          width: context.width,
                          height: 140,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.features.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemBuilder: (context, index) {
                              final feature = state.features[index];
                              return FeatureCard(feature: feature);
                            },
                          ),
                        ).bottomPadding(24),

                        /// Plan List
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: state.plans.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final plan = state.plans[index];
                            return PlanCard(
                              plan: plan,
                              currentIndex: state.selectedPlanIndex,
                              planIndex: index,
                              onTap: () => cubit.selectPlan(index),
                            );
                          },
                        ).bottomPadding(24),

                        /// CTA Button
                        AppRoundedButton(
                          buttonText: LocaleKeys.paywall_cta_button.tr(),
                          onTap: cubit.subscribe,
                        ),

                        /// Disclaimer
                        Text(
                          LocaleKeys.paywall_disclaimer.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.surface.withAlpha(140),
                            fontSize: 11,
                          ),
                        ).topPadding(10).horizontalPadding(20),

                        /// Footer Links
                        PaywallFooterLinks(
                          onRestorePurchases: cubit.restorePurchases,
                        ).topPadding(8).bottomPadding(40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
