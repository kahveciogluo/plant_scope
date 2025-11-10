import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/core/managers/global_overlay_manager/widgets/popup_widget.dart';

/// Global overlay widget that listens to GlobalOverlayManager
/// Shows loading or popup overlays based on the manager's state
class GlobalOverlayWidget extends StatelessWidget {
  const GlobalOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final overlayManager = ml<GlobalOverlayManager>();

    return ListenableBuilder(
      listenable: overlayManager,
      builder: (context, child) {
        final stateType = overlayManager.stateType;
        final bgColor = overlayManager.backgroundColor;

        return switch (stateType) {
          GlobalOverlayType.loading => Container(
            color: bgColor ?? Colors.black.withAlpha(100),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          GlobalOverlayType.infoPopup => Container(
            color: bgColor ?? Colors.black.withAlpha(100),
            child: PopupWidget(
              popupType: PopupType.info,
              title: overlayManager.popupTitle,
              message: overlayManager.popupMessage,
              defaultAction: overlayManager.popupDefaultAction,
              defaultActionText: overlayManager.popupDefaultActionText,
              secondAction: overlayManager.popupSecondAction,
              secondActionText: overlayManager.popupSecondActionText,
              showIcon: overlayManager.showPopupIcon,
              customIcon: overlayManager.customIcon,
            ),
          ),
          GlobalOverlayType.errorPopup => Container(
            color: bgColor ?? Colors.black.withAlpha(100),
            child: PopupWidget(
              popupType: PopupType.error,
              title: overlayManager.popupTitle,
              message: overlayManager.popupMessage,
              defaultAction: overlayManager.popupDefaultAction,
              defaultActionText: overlayManager.popupDefaultActionText,
              secondAction: overlayManager.popupSecondAction,
              secondActionText: overlayManager.popupSecondActionText,
              showIcon: overlayManager.showPopupIcon,
              customIcon: overlayManager.customIcon,
            ),
          ),
          GlobalOverlayType.customPopup => Container(
            color: bgColor ?? Colors.black.withAlpha(100),
            child: PopupWidget(
              popupType: PopupType.custom,
              title: overlayManager.popupTitle,
              message: overlayManager.popupMessage,
              defaultAction: overlayManager.popupDefaultAction,
              defaultActionText: overlayManager.popupDefaultActionText,
              secondAction: overlayManager.popupSecondAction,
              secondActionText: overlayManager.popupSecondActionText,
              showIcon: overlayManager.showPopupIcon,
              customIcon: overlayManager.customIcon,
            ),
          ),
          GlobalOverlayType.none => const SizedBox.shrink(),
        };
      },
    );
  }
}
