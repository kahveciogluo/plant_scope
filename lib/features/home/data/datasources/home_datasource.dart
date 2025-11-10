import 'package:plant_scope/features/home/data/models/category_model.dart';

import '../models/question_model.dart';

abstract class HomeDataSource {
  Future<List<QuestionModel>?> getQuestions();
  Future<List<CategoryModel>?> getCategories();
}
