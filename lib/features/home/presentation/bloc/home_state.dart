import 'package:equatable/equatable.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/question_entity.dart';

class HomeState extends Equatable {
  final List<QuestionEntity> questions;
  final List<CategoryEntity> categories;
  final bool isLoadingQuestions;
  final bool isLoadingCategories;
  final String? error;

  const HomeState({
    this.questions = const [],
    this.categories = const [],
    this.isLoadingQuestions = false,
    this.isLoadingCategories = false,
    this.error,
  });

  HomeState copyWith({
    List<QuestionEntity>? questions,
    List<CategoryEntity>? categories,
    bool? isLoadingQuestions,
    bool? isLoadingCategories,
    String? error,
  }) {
    return HomeState(
      questions: questions ?? this.questions,
      categories: categories ?? this.categories,
      isLoadingQuestions: isLoadingQuestions ?? this.isLoadingQuestions,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    questions,
    categories,
    isLoadingQuestions,
    isLoadingCategories,
    error,
  ];
}
