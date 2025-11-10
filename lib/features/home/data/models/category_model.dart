import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_scope/features/home/data/models/category_image_detail_model.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryModel({
    int? id,
    String? title,
    int? rank,
    CategoryImageDetailModel? image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelExtension on CategoryModel {
  CategoryEntity get toEntity =>
      CategoryEntity(id: id, title: title, rank: rank, image: image?.toEntity);
}
