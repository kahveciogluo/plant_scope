import 'package:plant_scope/app_export.dart';

class UserEntity extends Equatable {
  final bool onboardingCompleted;
  final String? token;
  const UserEntity({this.onboardingCompleted = false, this.token});

  @override
  List<Object?> get props => [onboardingCompleted, token];
}
