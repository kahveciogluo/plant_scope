import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_scope/features/main_view/presentation/cubit/main_cubit.dart';

void main() {
  group('MainCubit', () {
    late MainCubit mainCubit;

    setUp(() {
      mainCubit = MainCubit();
    });

    tearDown(() {
      mainCubit.close();
    });

    test('initial state is 0', () {
      expect(mainCubit.state, 0);
    });

    test('changeTab updates state', () {
      mainCubit.changeTab(2);
      expect(mainCubit.state, 2);

      mainCubit.changeTab(4);
      expect(mainCubit.state, 4);

      mainCubit.changeTab(0);
      expect(mainCubit.state, 0);
    });

    test('multiple changeTab calls work correctly', () {
      expect(mainCubit.state, 0);

      mainCubit.changeTab(1);
      expect(mainCubit.state, 1);

      mainCubit.changeTab(3);
      expect(mainCubit.state, 3);

      mainCubit.changeTab(2);
      expect(mainCubit.state, 2);
    });
  });

  group('MainCubit Widget Test', () {
    testWidgets('changes tab correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => MainCubit(),
            child: Builder(
              builder: (context) {
                final cubit = context.read<MainCubit>();
                return Scaffold(
                  body: BlocBuilder<MainCubit, int>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text('Tab: $state'),
                          ElevatedButton(
                            onPressed: () => cubit.changeTab(2),
                            child: const Text('Go to Tab 2'),
                          ),
                        ],
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

      expect(find.text('Tab: 0'), findsOneWidget);

      await tester.tap(find.text('Go to Tab 2'));
      await tester.pumpAndSettle();

      expect(find.text('Tab: 2'), findsOneWidget);
    });
  });
}
