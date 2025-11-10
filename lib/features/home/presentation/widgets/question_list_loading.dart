import 'package:plant_scope/app_export.dart';
import 'package:shimmer/shimmer.dart';

class QuestionListLoading extends StatelessWidget {
  const QuestionListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: context.width * 0.7 * 0.6,
          width: context.width * 0.7,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
