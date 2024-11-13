import '/config/all_imports.dart';

Widget cachedNetworkImage(
  String imageUrl,
) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
  );
}

CachedNetworkImageProvider cachedNetworkImageProvider(
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
