import 'package:plant_scope/features/home/presentation/widgets/category_card.dart';
import 'package:plant_scope/features/home/presentation/widgets/category_list_loading.dart';
import 'package:plant_scope/features/home/presentation/widgets/home_app_bar.dart';
import 'package:plant_scope/features/home/presentation/widgets/premium_banner.dart';
import 'package:plant_scope/features/home/presentation/widgets/question_card.dart';
import 'package:plant_scope/features/home/presentation/widgets/question_list_loading.dart';
import '../../../../app_export.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ml<HomeBloc>()..add(GetHomeDataEvent()),
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(GetHomeDataEvent());
                await Future.delayed(const Duration(milliseconds: 500));
                // Scroll to top when refreshing
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /// Premium Banner
                    const PremiumBanner()
                        .horizontalPadding(20)
                        .bottomPadding(24),

                    /// Question horizontal list
                    SizedBox(
                      height: context.width * 0.7 * 0.6,
                      child: state.isLoadingQuestions
                          ? const QuestionListLoading()
                          : state.questions.isEmpty
                          ? const Center(child: Text('No questions available'))
                          : ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.questions.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final question = state.questions[index];
                                return QuestionCard(question: question);
                              },
                            ),
                    ).bottomPadding(16),

                    /// Category list
                    state.isLoadingCategories
                        ? SizedBox(
                            height: 400,
                            child: const CategoryListLoading(),
                          )
                        : state.categories.isEmpty
                        ? const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('No categories available'),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              return CategoryCard(category: category);
                            },
                          ).bottomPadding(200),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
