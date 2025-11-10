import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../entities/question_entity.dart';
import '../repositories/home_repository.dart';

class GetQuestionsUseCase {
  final HomeRepository repository;

  GetQuestionsUseCase(this.repository);

  Future<Either<NetworkException, List<QuestionEntity>>> call() async {
    return await repository.getQuestions();
  }
}
