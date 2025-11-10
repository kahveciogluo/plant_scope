import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/question_entity.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionModel({
    int? id,
    String? title,
    String? subtitle,
    String? imageUri,
    String? uri,
    int? order,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

extension QuestionModelExtension on QuestionModel {
  QuestionEntity get toEntity => QuestionEntity(
    id: id,
    title: title,
    subtitle: subtitle,
    imageUri: imageUri,
    uri: uri,
    order: order,
  );
}
