import 'package:plant_scope/app_export.dart';

class FeatureEntity extends Equatable {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  const FeatureEntity({this.icon, this.title, this.subtitle});

  @override
  List<Object?> get props => [icon, title, subtitle];
}
