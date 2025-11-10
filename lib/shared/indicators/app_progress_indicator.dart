import '../../../../app_export.dart';

class AppProgressIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const AppProgressIndicator({
    super.key,
    required this.currentIndex,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          width: currentIndex == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? context.colors.primary
                : context.colors.primary.withAlpha(80),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
