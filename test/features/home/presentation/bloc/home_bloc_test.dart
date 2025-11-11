import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_scope/core/errors/exceptions.dart';
import 'package:plant_scope/features/home/domain/entities/category_entity.dart';
import 'package:plant_scope/features/home/domain/entities/question_entity.dart';
import 'package:plant_scope/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plant_scope/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plant_scope/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_scope/features/home/presentation/bloc/home_event.dart';
import 'package:plant_scope/features/home/presentation/bloc/home_state.dart';

class MockGetQuestionsUseCase extends Mock implements GetQuestionsUseCase {}

class MockGetCategoriesUsecase extends Mock implements GetCategoriesUsecase {}

void main() {
  late HomeBloc homeBloc;
  late MockGetQuestionsUseCase mockGetQuestionsUseCase;
  late MockGetCategoriesUsecase mockGetCategoriesUsecase;

  setUp(() {
    mockGetQuestionsUseCase = MockGetQuestionsUseCase();
    mockGetCategoriesUsecase = MockGetCategoriesUsecase();
    homeBloc = HomeBloc(
      getQuestionsUseCase: mockGetQuestionsUseCase,
      getCategoriesUsecase: mockGetCategoriesUsecase,
    );
  });

  tearDown(() {
    homeBloc.close();
  });

  test('initial state has empty lists', () {
    expect(homeBloc.state.questions, isEmpty);
    expect(homeBloc.state.categories, isEmpty);
    expect(homeBloc.state.isLoadingQuestions, false);
    expect(homeBloc.state.isLoadingCategories, false);
  });

  group('GetHomeDataEvent', () {
    final mockQuestions = [
      const QuestionEntity(
        id: 1,
        title: 'Test Question 1',
        subtitle: 'Test Subtitle 1',
      ),
      const QuestionEntity(
        id: 2,
        title: 'Test Question 2',
        subtitle: 'Test Subtitle 2',
      ),
    ];

    final mockCategories = [
      const CategoryEntity(id: 1, title: 'Test Category 1'),
      const CategoryEntity(id: 2, title: 'Test Category 2'),
    ];

    blocTest<HomeBloc, HomeState>(
      'emits loading states and then loaded state when data is fetched successfully',
      build: () {
        when(
          () => mockGetQuestionsUseCase.call(),
        ).thenAnswer((_) async => Right(mockQuestions));
        when(
          () => mockGetCategoriesUsecase.call(),
        ).thenAnswer((_) async => Right(mockCategories));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetHomeDataEvent()),
      expect: () => [
        // Initial loading state for both
        isA<HomeState>()
            .having(
              (state) => state.isLoadingQuestions,
              'isLoadingQuestions',
              true,
            )
            .having(
              (state) => state.isLoadingCategories,
              'isLoadingCategories',
              true,
            ),
        // Questions loaded
        isA<HomeState>()
            .having((state) => state.questions.length, 'questions length', 2)
            .having(
              (state) => state.isLoadingQuestions,
              'isLoadingQuestions',
              false,
            ),
        // Categories loaded
        isA<HomeState>()
            .having((state) => state.categories.length, 'categories length', 2)
            .having(
              (state) => state.isLoadingCategories,
              'isLoadingCategories',
              false,
            ),
      ],
      verify: (_) {
        verify(() => mockGetQuestionsUseCase.call()).called(1);
        verify(() => mockGetCategoriesUsecase.call()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits error state when fetching questions fails',
      build: () {
        when(() => mockGetQuestionsUseCase.call()).thenAnswer(
          (_) async => Left(NetworkException('Failed to fetch questions')),
        );
        when(
          () => mockGetCategoriesUsecase.call(),
        ).thenAnswer((_) async => Right(mockCategories));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetHomeDataEvent()),
      expect: () => [
        // Initial loading
        isA<HomeState>()
            .having(
              (state) => state.isLoadingQuestions,
              'isLoadingQuestions',
              true,
            )
            .having(
              (state) => state.isLoadingCategories,
              'isLoadingCategories',
              true,
            ),
        // Questions error or categories loaded (order varies)
        isA<HomeState>(),
        // Both finished
        isA<HomeState>()
            .having(
              (state) => state.isLoadingQuestions,
              'isLoadingQuestions',
              false,
            )
            .having(
              (state) => state.isLoadingCategories,
              'isLoadingCategories',
              false,
            ),
      ],
    );
  });
}
