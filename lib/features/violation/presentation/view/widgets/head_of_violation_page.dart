import '/config/all_imports.dart';

Widget headOfViolationPage({
  Locale? locale,
}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      start: ManagerWidth.w5,
      end: ManagerWidth.w5,
    ),
    child: Text(
      ManagerStrings.titleHeadViolation,
      locale: locale,
      textAlign: TextAlign.center,
      textScaler: const TextScaler.linear(0.9),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(
        fontFamily: ManagerFontFamily.cairo,
        fontSize: ManagerFontsSizes.f8,
        color: ManagerColors.black,
        fontWeight: ManagerFontWeight.bold,
        height: 2,
        locale: locale,
      ),
    ),
  );
}
