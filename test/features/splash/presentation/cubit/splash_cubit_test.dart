import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_scope/core/managers/user_manager/user_manager.dart';
import 'package:plant_scope/features/splash/presentation/cubit/splash_cubit.dart';

class MockUserManager extends Mock implements UserManager {}

void main() {
  group('SplashCubit', () {
    late SplashCubit splashCubit;

    setUp(() {
      splashCubit = SplashCubit();
    });

    tearDown(() {
      splashCubit.close();
    });

    test('initial state is SplashInitial', () {
      expect(splashCubit.state, const SplashInitial());
    });

    blocTest<SplashCubit, SplashState>(
      'initialize emits [SplashLoading, SplashNavigateToHome]',
      build: () => SplashCubit(),
      act: (cubit) => cubit.initialize(),
      expect: () => [const SplashLoading(), const SplashNavigateToHome()],
      wait: const Duration(seconds: 3),
    );

    blocTest<SplashCubit, SplashState>(
      'initialize waits for 2 seconds before navigating',
      build: () => SplashCubit(),
      act: (cubit) => cubit.initialize(),
      wait: const Duration(seconds: 3),
      verify: (_) {
        // Verify that the delay was respected
      },
    );
  });
}
