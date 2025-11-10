import 'package:dartz/dartz.dart';
import 'package:plant_scope/features/home/domain/entities/category_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../entities/question_entity.dart';

abstract class HomeRepository {
  Future<Either<NetworkException, List<QuestionEntity>>> getQuestions();
  Future<Either<NetworkException, List<CategoryEntity>>> getCategories();
}
