import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_scope/core/managers/user_manager/user_manager.dart';
import 'package:plant_scope/features/payment/presentation/cubit/paywall_cubit.dart';

class MockUserManager extends Mock implements UserManager {}

void main() {
  group('PaywallCubit', () {
    late PaywallCubit paywallCubit;

    setUp(() {
      paywallCubit = PaywallCubit();
    });

    tearDown(() {
      paywallCubit.close();
    });

    test('initial state is correct', () {
      expect(paywallCubit.state.selectedPlanIndex, 1);
      expect(paywallCubit.state.features.length, 3);
      expect(paywallCubit.state.plans.length, 2);
    });

    blocTest<PaywallCubit, PaywallState>(
      'selectPlan emits state with updated selectedPlanIndex',
      build: () => paywallCubit,
      act: (cubit) => cubit.selectPlan(0),
      expect: () => [paywallCubit.state.copyWith(selectedPlanIndex: 0)],
    );

    blocTest<PaywallCubit, PaywallState>(
      'selectPlan with different index updates state correctly',
      build: () => PaywallCubit(),
      act: (cubit) => cubit.selectPlan(1),
      expect: () => [
        isA<PaywallState>().having(
          (state) => state.selectedPlanIndex,
          'selectedPlanIndex',
          1,
        ),
      ],
    );

    blocTest<PaywallCubit, PaywallState>(
      'multiple selectPlan calls emit states correctly',
      build: () => PaywallCubit(),
      act: (cubit) {
        cubit.selectPlan(0);
        cubit.selectPlan(1);
        cubit.selectPlan(0);
      },
      expect: () => [
        isA<PaywallState>().having(
          (state) => state.selectedPlanIndex,
          'selectedPlanIndex',
          0,
        ),
        isA<PaywallState>().having(
          (state) => state.selectedPlanIndex,
          'selectedPlanIndex',
          1,
        ),
        isA<PaywallState>().having(
          (state) => state.selectedPlanIndex,
          'selectedPlanIndex',
          0,
        ),
      ],
    );

    test('subscribe method exists and can be called', () {
      expect(() => paywallCubit.subscribe(), returnsNormally);
    });

    test('restorePurchases method exists and can be called', () {
      expect(() => paywallCubit.restorePurchases(), returnsNormally);
    });

    test('features list is not empty', () {
      expect(paywallCubit.state.features, isNotEmpty);
      expect(paywallCubit.state.features.length, 3);
    });

    test('plans list is not empty', () {
      expect(paywallCubit.state.plans, isNotEmpty);
      expect(paywallCubit.state.plans.length, 2);
    });

    test('initial selected plan index is 1', () {
      expect(paywallCubit.state.selectedPlanIndex, 1);
    });
  });
}
