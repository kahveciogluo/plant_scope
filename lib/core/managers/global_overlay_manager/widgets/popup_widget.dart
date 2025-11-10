import 'package:plant_scope/app_export.dart';

class PopupWidget extends StatelessWidget {
  final PopupType popupType;
  final bool? showIcon;
  final String? title;
  final String? message;
  final VoidCallback? defaultAction;
  final String? defaultActionText;
  final VoidCallback? secondAction;
  final String? secondActionText;
  final IconData? customIcon;

  const PopupWidget({
    super.key,
    required this.popupType,
    this.showIcon,
    this.title,
    this.message,
    this.defaultAction,
    this.defaultActionText,
    this.secondAction,
    this.secondActionText,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    final overlayManager = ml<GlobalOverlayManager>();

    return SizedBox(
      width: context.width,
      height: context.height,
      child: Center(
        child: Container(
          width: context.width - 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon ?? true)
                FaIcon(
                  customIcon ?? popupType.icon,
                  size: 30,
                  color: context.colors.primary,
                ).bottomPadding(20),
              if (title != null)
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium,
                ).horizontalPadding(20).bottomPadding(10),
              if (message != null)
                Text(
                  message!,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colors.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ).horizontalPadding(20).bottomPadding(15),

              /// Second Action
              if (secondActionText != null)
                Column(
                  children: [
                    Divider(height: 1, color: context.colors.secondary),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        overlayManager.setNone();
                        secondAction?.call();
                      },
                      child: Text(
                        secondActionText ?? '',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colors.primary,
                        ),
                      ).allPadding(15),
                    ),
                  ],
                ),

              /// Default Action
              Column(
                children: [
                  Divider(height: 1, color: context.colors.secondary),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      overlayManager.setNone();
                      defaultAction?.call();
                    },
                    child: Text(
                      defaultActionText ?? 'OK',
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.colors.secondary,
                      ),
                    ).allPadding(15),
                  ),
                ],
              ),
            ],
          ).topPadding(30),
        ),
      ),
    );
  }
}
