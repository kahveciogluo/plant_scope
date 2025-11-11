import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_scope/features/payment/presentation/cubit/paywall_cubit.dart';

void main() {
  group('PaywallPage Widget Tests', () {
    testWidgets('Plan selection updates correctly', (
      WidgetTester tester,
    ) async {
      final cubit = PaywallCubit();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: cubit,
            child: BlocBuilder<PaywallCubit, PaywallState>(
              builder: (context, state) {
                return Scaffold(
                  body: Column(
                    children: [
                      Text('Selected Plan: ${state.selectedPlanIndex}'),
                      ElevatedButton(
                        onPressed: () => cubit.selectPlan(0),
                        child: const Text('Select Plan 0'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initial state should be plan 1
      expect(find.text('Selected Plan: 1'), findsOneWidget);

      // Tap to select plan 0
      await tester.tap(find.text('Select Plan 0'));
      await tester.pumpAndSettle();

      // Should now show plan 0 as selected
      expect(find.text('Selected Plan: 0'), findsOneWidget);
    });

    testWidgets('Feature list displays correct number of items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => PaywallCubit(),
            child: Builder(
              builder: (context) {
                final cubit = context.read<PaywallCubit>();
                return Scaffold(
                  body: ListView.builder(
                    itemCount: cubit.state.features.length,
                    itemBuilder: (context, index) {
                      final feature = cubit.state.features[index];
                      return ListTile(
                        leading: Icon(feature.icon),
                        title: Text(feature.title ?? ''),
                        subtitle: Text(feature.subtitle ?? ''),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify 3 features are displayed
      expect(find.byType(ListTile), findsNWidgets(3));
    });
  });
}
