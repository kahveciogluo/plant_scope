import 'dart:convert';
import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/home/data/models/category_model.dart';
import '../models/question_model.dart';
import 'home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final NetworkManager networkManager;

  HomeDataSourceImpl({required this.networkManager});

  @override
  Future<List<QuestionModel>?> getQuestions() async {
    try {
      final response = await networkManager.get(Endpoints.getQuestions);
      final responseData = jsonDecode(response.data);
      final list = responseData as List<dynamic>;

      final questions = list
          .map((json) => QuestionModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return questions;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>?> getCategories() async {
    try {
      final response = await networkManager.get(Endpoints.getCategories);

      final responseData = jsonDecode(response.data);
      final list = responseData['data'] as List<dynamic>;

      final categories = list
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
