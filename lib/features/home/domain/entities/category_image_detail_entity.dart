import 'package:equatable/equatable.dart';

class CategoryImageDetailEntity extends Equatable {
  final String? url;

  const CategoryImageDetailEntity({this.url});

  @override
  List<Object?> get props => [url];
}
