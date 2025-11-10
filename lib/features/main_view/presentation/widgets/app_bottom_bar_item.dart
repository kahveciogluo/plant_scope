import 'package:plant_scope/app_export.dart';
import '../cubit/main_cubit.dart';

class AppBottomBarItem extends StatelessWidget {
  final String? label;
  final SvgGenImage svgIcon;
  final StatefulNavigationShell navigationShell;
  final int index;
  const AppBottomBarItem({
    super.key,
    required this.navigationShell,
    required this.index,
    this.label,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = navigationShell.currentIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<MainCubit>().changeTab(index),
      child: index == 2
          ? Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.primary,
                border: Border.all(color: context.colors.secondary, width: 4),
              ),
              child: Center(
                child: Assets.images.identify.svg(
                  width: 36,
                  colorFilter: ColorFilter.mode(
                    context.colors.surface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  svgIcon.svg(
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? context.colors.primary
                          : context.colors.tertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label ?? '',
                    style: context.textTheme.labelMedium!.copyWith(
                      color: isActive
                          ? context.colors.primary
                          : context.colors.tertiary,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
