import '/config/all_imports.dart';

Widget mainDrawer({
  required List<Widget> children,
}) {
  return Drawer(
    backgroundColor: ManagerColors.white,
    width: ManagerWidth.w290,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide.none,
    ),
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      children: children,
    ),
  );
}

Widget buttonOfMyDrawer({
  required Function() onPressed,
  required String icon,
  required String title,
  double? heightIcon,
  double? widthIcon,
}) {
  return ListTile(
    onTap: onPressed,
    leading: Image.asset(
      icon,
      height: heightIcon ?? ManagerHeight.h24,
      width: widthIcon ?? ManagerWidth.w24,
      fit: BoxFit.cover,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: ManagerColors.black,
        fontSize: ManagerFontsSizes.f15,
        fontWeight: ManagerFontWeight.semiBold,
        fontFamily: ManagerFontFamily.cairo,
      ),
    ),
    style: ListTileStyle.drawer,
    contentPadding: EdgeInsetsDirectional.only(
      start: ManagerWidth.w33,
    ),
  );
}
