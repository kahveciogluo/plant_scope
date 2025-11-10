import 'package:plant_scope/app_export.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width, height;
  final double borderRadius;
  final IconData? faErrorIcon;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final BoxFit fit;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.faErrorIcon,
    this.borderRadiusGeometry,
    this.errorWidget,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width,
      height: height ?? context.height,
      decoration: BoxDecoration(
        borderRadius:
            borderRadiusGeometry ??
            BorderRadius.all(Radius.circular(borderRadius)),
        color: context.colors.primary.withAlpha(100),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius:
                borderRadiusGeometry ??
                BorderRadius.all(Radius.circular(borderRadius)),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: width ?? context.width,
            height: height ?? context.height,
            decoration: BoxDecoration(
              borderRadius:
                  borderRadiusGeometry ??
                  BorderRadius.all(Radius.circular(borderRadius)),
              color: Colors.grey,
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Center(
              child: FaIcon(
                faErrorIcon ?? FontAwesomeIcons.triangleExclamation,
                color: context.colors.surfaceContainerHighest,
              ),
            ),
      ),
    );
  }
}
