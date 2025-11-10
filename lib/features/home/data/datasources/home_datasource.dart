import '../models/question_model.dart';

abstract class HomeDataSource {
  Future<List<QuestionModel>?> getQuestions();
}
