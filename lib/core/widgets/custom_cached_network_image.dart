import '/config/all_imports.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => CustomLoading(),
      errorWidget: (context, url, error) => Container(
        color: context.theme.primaryColor,
        child: Icon(
          Icons.person,
          size: ManagerIconsSizes.i24,
          color: Colors.white,
        ),
      ),
    );
  }
}

CachedNetworkImageProvider customCachedNetworkImageProvider(
  String imageUrl, {
  int? maxHeight,
  int? maxWidth,
}) {
  return CachedNetworkImageProvider(
    imageUrl,
    maxHeight: maxHeight,
    maxWidth: maxWidth,
  );
}
