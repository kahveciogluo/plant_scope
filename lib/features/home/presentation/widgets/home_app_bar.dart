import 'package:plant_scope/app_export.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.homeAppBarBackground.provider(),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hello & Greeting Text
              Text(
                LocaleKeys.home_hello.tr(),
                style: context.textTheme.bodyLarge,
              ).bottomPadding(4),

              Text(
                DateTime.now().greetingMessage,
                style: context.textTheme.titleLarge,
              ).bottomPadding(20),

              // Search Bar
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: LocaleKeys.home_search_for_plants.tr(),
                    hintStyle: TextStyle(
                      color: context.colors.tertiary,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: context.colors.tertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ],
          ).horizontalPadding(16).verticalPadding(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(240);
}
