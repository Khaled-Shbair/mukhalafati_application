import '/config/all_imports.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
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

// CachedNetworkImage(
//   imageUrl:
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY5QpkHeEVJzI-D1FgkyVIEn4Tl_vLvsENnQ&s',
//   placeholder: (context, url) => myLoading(),
//   imageBuilder: (context, imageProvider) => CircleAvatar(
//     radius: ManagerRadius.r40,
//     backgroundImage: imageProvider,
//     backgroundColor: ManagerColors.white,
//   ),
//   errorWidget: (context, url, error) => CircleAvatar(
//     radius: ManagerRadius.r40,
//     backgroundColor: ManagerColors.white,
//   ),
// ),
