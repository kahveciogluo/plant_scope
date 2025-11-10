import 'package:plant_scope/app_export.dart';

class PlanEntity extends Equatable {
  final String? title;
  final String? subtitle;
  final String? badge;
  const PlanEntity({this.title, this.subtitle, this.badge});

  @override
  List<Object?> get props => [title, subtitle, badge];
}
