import 'package:plant_scope/app_export.dart';

enum PopupType { info, error, custom }

extension PopupTypeExtension on PopupType {
  IconData get icon {
    switch (this) {
      case PopupType.info:
        return FontAwesomeIcons.info;
      case PopupType.error:
        return FontAwesomeIcons.triangleExclamation;
      case PopupType.custom:
        return FontAwesomeIcons.bolt;
    }
  }
}
