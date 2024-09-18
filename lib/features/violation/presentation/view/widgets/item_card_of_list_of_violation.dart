import '/config/all_imports.dart';

Widget itemCardOfListOfViolation({
  required String text,
  required IconData icon,
  Widget? trailing,
  double? minVerticalPadding,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: ManagerColors.black,
      size: ManagerIconsSizes.i24,
    ),
    title: Text(
      text,
      style: TextStyle(
        fontSize: ManagerFontsSizes.f11,
        fontWeight: ManagerFontWeight.semiBold,
        fontFamily: ManagerFontFamily.cairo,
        color: ManagerColors.black,
      ),
    ),
    trailing: trailing,
    minTileHeight: ManagerHeight.h20,
    minVerticalPadding: minVerticalPadding,
    onTap: () {
      debugPrint('ss');
    },
  );
}
