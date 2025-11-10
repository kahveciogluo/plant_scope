import 'package:plant_scope/features/home/presentation/widgets/home_app_bar.dart';
import 'package:plant_scope/features/home/presentation/widgets/question_card.dart';
import '../../../../app_export.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ml<HomeBloc>()..add(LoadQuestionsEvent()),
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(LoadQuestionsEvent()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is QuestionList) {
              return SizedBox(
                /// Question Card yüksekliği
                height: context.width * 0.7 * 0.6,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.questions.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final question = state.questions[index];
                    return QuestionCard(question: question);
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
