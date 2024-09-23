import '/config/all_imports.dart';

Widget mainDrawer({
  required List<Widget> children,
}) {
  return Drawer(
    backgroundColor: ManagerColors.white,
    width: ManagerWidth.w199,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w19,
        end: ManagerWidth.w19,
      ),
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
  return mainButton(
    onPressed: onPressed,
    height: ManagerHeight.h36,
    child: ListTile(
      leading: Image.asset(
        icon,
        height: heightIcon ?? ManagerHeight.h19,
        width: widthIcon ?? ManagerWidth.w19,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: ManagerColors.white,
          fontSize: ManagerFontsSizes.f12,
          fontWeight: ManagerFontWeight.semiBold,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
      contentPadding: EdgeInsetsDirectional.zero,
      horizontalTitleGap: ManagerWidth.w12,
    ),
  );
}
