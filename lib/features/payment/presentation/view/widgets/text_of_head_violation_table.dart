import '/config/all_imports.dart';

Widget textOfHeadViolationTable(String text) {
  return Text(
    text,
    style: TextStyle(
      color: ManagerColors.black70,
      fontFamily: ManagerFontFamily.cairo,
      fontWeight: ManagerFontWeight.semiBold,
      fontSize: ManagerFontsSizes.f12,
    ),
  );
}
