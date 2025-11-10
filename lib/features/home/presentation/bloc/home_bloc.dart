import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetQuestionsUseCase getQuestionsUseCase;

  HomeBloc({required this.getQuestionsUseCase}) : super(HomeInitial()) {
    on<LoadQuestionsEvent>(_onLoadQuestions);
  }

  Future<void> _onLoadQuestions(
    LoadQuestionsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final result = await getQuestionsUseCase();

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (questions) => emit(QuestionList(questions)),
    );
  }
}
