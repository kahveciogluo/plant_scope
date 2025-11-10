part of 'paywall_cubit.dart';

class PaywallState extends Equatable {
  final int selectedPlanIndex;
  final List<FeatureEntity> features;
  final List<PlanEntity> plans;
  const PaywallState({
    required this.selectedPlanIndex,
    required this.features,
    required this.plans,
  });

  PaywallState copyWith({
    int? selectedPlanIndex,
    List<FeatureEntity>? features,
    List<PlanEntity>? plans,
  }) {
    return PaywallState(
      selectedPlanIndex: selectedPlanIndex ?? this.selectedPlanIndex,
      features: features ?? this.features,
      plans: plans ?? this.plans,
    );
  }

  @override
  List<Object?> get props => [selectedPlanIndex, features];
}
