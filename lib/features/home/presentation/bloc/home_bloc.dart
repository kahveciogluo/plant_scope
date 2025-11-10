import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  final GetCategoriesUsecase getCategoriesUsecase;

  HomeBloc({
    required this.getQuestionsUseCase,
    required this.getCategoriesUsecase,
  }) : super(const HomeState()) {
    on<GetHomeDataEvent>(_onLoadHomeData);
    on<QuestionsLoadedEvent>(_onQuestionsLoaded);
    on<CategoriesLoadedEvent>(_onCategoriesLoaded);
  }

  Future<void> _onLoadHomeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingQuestions: true, isLoadingCategories: true));

    // Trigger both API calls and add events when they complete
    getQuestionsUseCase().then((result) => add(QuestionsLoadedEvent(result)));
    getCategoriesUsecase().then((result) => add(CategoriesLoadedEvent(result)));
  }

  void _onQuestionsLoaded(QuestionsLoadedEvent event, Emitter<HomeState> emit) {
    final result =
        event.result as Either<NetworkException, List<QuestionEntity>>;
    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingQuestions: false, error: failure.message),
      ),
      (questions) =>
          emit(state.copyWith(questions: questions, isLoadingQuestions: false)),
    );
  }

  void _onCategoriesLoaded(
    CategoriesLoadedEvent event,
    Emitter<HomeState> emit,
  ) {
    final result =
        event.result as Either<NetworkException, List<CategoryEntity>>;
    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingCategories: false, error: failure.message),
      ),
      (categories) => emit(
        state.copyWith(categories: categories, isLoadingCategories: false),
      ),
    );
  }
}
