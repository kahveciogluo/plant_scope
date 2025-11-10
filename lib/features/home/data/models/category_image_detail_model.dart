import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_scope/features/home/domain/entities/category_image_detail_entity.dart';

part 'category_image_detail_model.freezed.dart';
part 'category_image_detail_model.g.dart';

@freezed
abstract class CategoryImageDetailModel with _$CategoryImageDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryImageDetailModel({String? url}) =
      _CategoryImageDetailModel;

  factory CategoryImageDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageDetailModelFromJson(json);
}

extension CategoryImageDetailModelExtension on CategoryImageDetailModel {
  CategoryImageDetailEntity get toEntity => CategoryImageDetailEntity(url: url);
}
