import 'package:equatable/equatable.dart';
import 'package:plant_scope/features/home/domain/entities/category_image_detail_entity.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? title;
  final int? rank;
  final CategoryImageDetailEntity? image;

  const CategoryEntity({this.id, this.title, this.rank, this.image});

  @override
  List<Object?> get props => [id];
}
