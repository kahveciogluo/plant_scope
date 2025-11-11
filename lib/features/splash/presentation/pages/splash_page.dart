import '../cubit/splash_cubit.dart';
import '../../../../app_export.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..initialize(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            context.go(AppRouter.home);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Assets.images.plantScopeLogo.image(width: 150)),
        ),
      ),
    );
  }
}
