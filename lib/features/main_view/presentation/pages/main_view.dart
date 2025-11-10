import '../../../../app_export.dart';
import '../cubit/main_cubit.dart';
import '../widgets/app_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, int>(
      listener: (context, tabIndex) {
        navigationShell.goBranch(
          tabIndex,
          initialLocation: tabIndex == navigationShell.currentIndex,
        );
      },
      child: Scaffold(
        body: navigationShell,
        extendBody: true,
        bottomNavigationBar: AppBottomBar(navigationShell: navigationShell),
      ),
    );
  }
}
