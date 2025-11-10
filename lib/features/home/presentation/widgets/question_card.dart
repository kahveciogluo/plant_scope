import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/home/domain/entities/question_entity.dart';
import 'package:plant_scope/features/shared/images/app_network_image.dart';

class QuestionCard extends StatelessWidget {
  final QuestionEntity question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRouter.appWebView.replaceAll('/', ''),
        queryParameters: {
          'url': question.uri ?? '',
          'pageTitle': question.title ?? '',
        },
      ), // Navigate to WebView on tap),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          /// Image
          AppNetworkImage(
            imageUrl: question.imageUri ?? '',
            height: context.width * 0.7 * 0.6,
            width: context.width * 0.7,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: context.width * 0.7,
            child: Text(
              question.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleSmall!.copyWith(
                color: context.colors.onPrimary,
              ),
            ).horizontalPadding(14).verticalPadding(10),
          ),
        ],
      ),
    );
  }
}
