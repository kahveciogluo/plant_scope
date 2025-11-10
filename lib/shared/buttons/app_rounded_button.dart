import 'package:plant_scope/app_export.dart';

class AppRoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final bool? isActive;
  final Color? activeButtonColor, activeTextColor;
  final Color? passiveButtonColor, passiveTextColor;
  const AppRoundedButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isActive = true,
    this.activeButtonColor,
    this.activeTextColor,
    this.passiveButtonColor,
    this.passiveTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap.call(),
      child: Container(
        width: context.width - 20 - 20,
        height: 56,
        decoration: BoxDecoration(
          color: isActive!
              ? activeButtonColor ?? context.colors.primary
              : passiveButtonColor ?? context.colors.surfaceContainerHighest,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium!.copyWith(
              color: isActive!
                  ? activeTextColor ?? context.colors.onPrimaryContainer
                  : passiveTextColor ??
                        context.colors.onSurfaceVariant.withAlpha(120),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ).onlyPadding(left: 20, right: 20),
      ),
    );
  }
}
