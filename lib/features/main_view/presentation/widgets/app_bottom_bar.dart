import 'package:plant_scope/app_export.dart';
import 'app_bottom_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppBottomBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(height: MediaQuery.sizeOf(context).height),
        Container(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 10,
            bottom: context.kHomeIndicatorHeight,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.surface,
            border: Border.fromBorderSide(
              BorderSide(
                color: context.colors.outline.withAlpha(100),
                width: 1,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: 0,
                child: AppBottomBarItem(
                  label: LocaleKeys.bottom_bar_home.tr(),
                  svgIcon: Assets.images.home,
                  navigationShell: navigationShell,
                  index: 0,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  AppBottomBarItem(
                    label: LocaleKeys.bottom_bar_diagnose.tr(),
                    svgIcon: Assets.images.healthcare,
                    navigationShell: navigationShell,
                    index: 1,
                  ),
                  Container(width: 70, height: 1, color: Colors.transparent),
                  AppBottomBarItem(
                    label: LocaleKeys.bottom_bar_my_garden.tr(),
                    svgIcon: Assets.images.myGarden,
                    navigationShell: navigationShell,
                    index: 3,
                  ),
                ],
              ),
              Positioned(
                right: 10,
                child: AppBottomBarItem(
                  label: LocaleKeys.bottom_bar_profile.tr(),
                  svgIcon: Assets.images.profile,
                  navigationShell: navigationShell,
                  index: 4,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: context.kHomeIndicatorHeight + 10,
          child: AppBottomBarItem(
            navigationShell: navigationShell,
            index: 2,
            svgIcon: Assets.images.identify,
          ),
        ),
      ],
    );
  }
}
