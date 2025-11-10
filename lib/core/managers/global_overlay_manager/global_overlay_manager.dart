import '../../../app_export.dart';

class GlobalOverlayManager extends ChangeNotifier {
  static final GlobalOverlayManager _instance =
      GlobalOverlayManager._internal();
  factory GlobalOverlayManager() => _instance;
  GlobalOverlayManager._internal();

  GlobalOverlayType _stateType = GlobalOverlayType.none;
  Color? _backgroundColor;
  PopupType? _popupType;
  bool? _showPopupIcon;
  String? _popupTitle;
  String? _popupMessage;
  VoidCallback? _popupDefaultAction;
  String? _popupDefaultActionText;
  VoidCallback? _popupSecondAction;
  String? _popupSecondActionText;
  IconData? _customIcon;

  // Getters
  GlobalOverlayType get stateType => _stateType;
  Color? get backgroundColor => _backgroundColor;
  PopupType? get popupType => _popupType;
  bool? get showPopupIcon => _showPopupIcon;
  String? get popupTitle => _popupTitle;
  String? get popupMessage => _popupMessage;
  VoidCallback? get popupDefaultAction => _popupDefaultAction;
  String? get popupDefaultActionText => _popupDefaultActionText;
  VoidCallback? get popupSecondAction => _popupSecondAction;
  String? get popupSecondActionText => _popupSecondActionText;
  IconData? get customIcon => _customIcon;

  void setNone() {
    _stateType = GlobalOverlayType.none;
    _clearPopupData();
    notifyListeners();
  }

  void isLoading(bool isLoading, {Color? backgroundColor}) {
    _stateType = isLoading ? GlobalOverlayType.loading : GlobalOverlayType.none;
    _backgroundColor = backgroundColor;
    if (!isLoading) _clearPopupData();
    notifyListeners();
  }

  void openInfoPopup({
    Color? backgroundColor,
    bool? showIcon,
    String? popupTitle,
    String? popupMessage,
    VoidCallback? defaultAction,
    String? defaultActionText,
    VoidCallback? secondAction,
    String? secondActionText,
    IconData? customIcon,
  }) {
    _stateType = GlobalOverlayType.infoPopup;
    _backgroundColor = backgroundColor;
    _popupType = PopupType.info;
    _showPopupIcon = showIcon;
    _popupTitle = popupTitle;
    _popupMessage = popupMessage;
    _popupDefaultAction = defaultAction;
    _popupDefaultActionText = defaultActionText;
    _popupSecondAction = secondAction;
    _popupSecondActionText = secondActionText;
    _customIcon = customIcon;
    notifyListeners();
  }

  void openErrorPopup({
    Color? backgroundColor,
    bool? showIcon,
    String? popupTitle,
    String? popupMessage,
    VoidCallback? defaultAction,
    String? defaultActionText,
    VoidCallback? secondAction,
    String? secondActionText,
    IconData? customIcon,
  }) {
    _stateType = GlobalOverlayType.errorPopup;
    _backgroundColor = backgroundColor;
    _popupType = PopupType.error;
    _showPopupIcon = showIcon;
    _popupTitle = popupTitle;
    _popupMessage = popupMessage;
    _popupDefaultAction = defaultAction;
    _popupDefaultActionText = defaultActionText;
    _popupSecondAction = secondAction;
    _popupSecondActionText = secondActionText;
    _customIcon = customIcon;
    notifyListeners();
  }

  void openCustomPopup({
    Color? backgroundColor,
    bool? showIcon,
    String? popupTitle,
    String? popupMessage,
    VoidCallback? defaultAction,
    String? defaultActionText,
    VoidCallback? secondAction,
    String? secondActionText,
    IconData? customIcon,
  }) {
    _stateType = GlobalOverlayType.customPopup;
    _backgroundColor = backgroundColor;
    _popupType = PopupType.custom;
    _showPopupIcon = showIcon;
    _popupTitle = popupTitle;
    _popupMessage = popupMessage;
    _popupDefaultAction = defaultAction;
    _popupDefaultActionText = defaultActionText;
    _popupSecondAction = secondAction;
    _popupSecondActionText = secondActionText;
    _customIcon = customIcon;
    notifyListeners();
  }

  void _clearPopupData() {
    _backgroundColor = null;
    _popupType = null;
    _showPopupIcon = null;
    _popupTitle = null;
    _popupMessage = null;
    _popupDefaultAction = null;
    _popupDefaultActionText = null;
    _popupSecondAction = null;
    _popupSecondActionText = null;
    _customIcon = null;
  }
}
