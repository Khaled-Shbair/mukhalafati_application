import '/config/all_imports.dart';

Widget expansionTileCard({
  required Function(bool value) onExpansionChanged,
  required String title,
  required bool isOpen,
  required List<Widget> children,
}) {
  return ExpansionTile(
    minTileHeight: ManagerHeight.h50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ManagerRadius.r5),
      side: BorderSide(
        width: ManagerWidth.w05,
        color: ManagerColors.primaryColor,
      ),
    ),
    textColor: ManagerColors.white,
    showTrailingIcon: false,
    collapsedTextColor: ManagerColors.primaryColor,
    backgroundColor: ManagerColors.primaryColor,
    collapsedBackgroundColor: ManagerColors.transparent,
    onExpansionChanged: onExpansionChanged,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: ManagerFontFamily.cairo,
        fontWeight:
            isOpen ? ManagerFontWeight.bold : ManagerFontWeight.semiBold,
        fontSize: ManagerFontsSizes.f12,
      ),
    ),
    children: children,
  );
}
