import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? imageUri;
  final String? uri;
  final int? order;

  const QuestionEntity({
    this.id,
    this.imageUri,
    this.title,
    this.subtitle,
    this.uri,
    this.order,
  });

  @override
  List<Object?> get props => [id, order];
}
