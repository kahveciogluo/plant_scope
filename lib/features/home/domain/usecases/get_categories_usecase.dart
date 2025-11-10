import 'package:dartz/dartz.dart';
import 'package:plant_scope/features/home/domain/entities/category_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../repositories/home_repository.dart';

class GetCategoriesUsecase {
  final HomeRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<Either<NetworkException, List<CategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}
