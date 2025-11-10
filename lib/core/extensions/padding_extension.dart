import 'package:plant_scope/app_export.dart';

extension PaddingExtension on Widget {
  Padding allPadding(double val) =>
      Padding(padding: EdgeInsets.all(val), child: this);

  Padding horizontalPadding(double val) => Padding(
    padding: EdgeInsets.symmetric(horizontal: val),
    child: this,
  );

  Padding verticalPadding(double val) => Padding(
    padding: EdgeInsets.symmetric(vertical: val),
    child: this,
  );

  Padding topPadding(double val) => Padding(
    padding: EdgeInsets.only(top: val),
    child: this,
  );

  Padding bottomPadding(double val) => Padding(
    padding: EdgeInsets.only(bottom: val),
    child: this,
  );

  Padding leftPadding(double val) => Padding(
    padding: EdgeInsets.only(left: val),
    child: this,
  );

  Padding rightPadding(double val) => Padding(
    padding: EdgeInsets.only(right: val),
    child: this,
  );

  Padding onlyPadding({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    ),
    child: this,
  );
}
