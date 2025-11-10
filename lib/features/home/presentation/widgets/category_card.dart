import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/home/domain/entities/category_entity.dart';
import 'package:plant_scope/features/shared/images/app_network_image.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          /// Image
          AppNetworkImage(
            imageUrl: category.image?.url ?? '',
            height: (context.width - 56) / 2,
            width: (context.width - 56) / 2,
            fit: BoxFit.fitWidth,
            placeholderColor: context.colors.secondary.withAlpha(10),
            boxBorder: Border.all(
              color: context.colors.tertiary.withAlpha(50),
              width: 1,
            ),
          ),

          SizedBox(
            width: (context.width - 56) / 4,
            height: (context.width - 56) / 2,
            child: Text(
              category.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleSmall,
            ).topPadding(16).leftPadding(16),
          ),
        ],
      ),
    );
  }
}
