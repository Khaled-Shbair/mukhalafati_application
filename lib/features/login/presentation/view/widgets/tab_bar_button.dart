import '/config/all_imports.dart';

Widget tabBarButton({
  required String image,
  double? heightImage,
  double? widthImage,
  required String name,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        image,
        height: heightImage ?? ManagerHeight.h24,
        width: widthImage ?? ManagerWidth.w24,
        fit: BoxFit.cover,
      ),
      SizedBox(width: ManagerWidth.w8),
      Text(name),
    ],
  );
}
