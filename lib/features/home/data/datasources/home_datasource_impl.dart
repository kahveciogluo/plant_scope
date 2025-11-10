import 'dart:convert';
import 'package:plant_scope/app_export.dart';
import '../models/question_model.dart';
import 'home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final NetworkManager networkManager;

  HomeDataSourceImpl({required this.networkManager});

  @override
  Future<List<QuestionModel>?> getQuestions() async {
    final response = await networkManager.get(Endpoints.getQuestions);
    final responseData = jsonDecode(response.data);
    final list = responseData as List<dynamic>;

    final questions = list
        .map((json) => QuestionModel.fromJson(json as Map<String, dynamic>))
        .toList();
    return questions;
  }
}
