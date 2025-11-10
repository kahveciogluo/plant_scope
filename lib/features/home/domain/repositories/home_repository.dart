import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../entities/question_entity.dart';

abstract class HomeRepository {
  Future<Either<NetworkException, List<QuestionEntity>>> getQuestions();
}
