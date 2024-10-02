import '/config/all_imports.dart';

PreferredSizeWidget homeAppBar({
  required String welcome,
  required String firstName,
  required Function() openEndDrawer,
  required Widget widget,
}) {
  return AppBar(
    leadingWidth: ManagerWidth.w199,
    toolbarHeight: ManagerHeight.h66,
    automaticallyImplyLeading: false,
    leading: Row(
      children: [
        SizedBox(width: ManagerWidth.w16),
        widget,
        SizedBox(width: ManagerWidth.w9),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              welcome,
              style: TextStyle(
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontsSizes.f15,
                color: ManagerColors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  firstName,
                  style: TextStyle(
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f15,
                    color: ManagerColors.eerieBlack,
                  ),
                ),
                SizedBox(width: ManagerWidth.w4),
                SvgPicture.asset(
                  ManagerAssets.welcomeIcon,
                  height: ManagerHeight.h24,
                  width: ManagerWidth.w24,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    actions: [
      mainButton(
        onPressed: openEndDrawer,
        minWidth: ManagerWidth.w30,
        height: ManagerHeight.h30,
        color: ManagerColors.transparent,
        highlightColor: ManagerColors.transparent,
        splashColor: ManagerColors.transparent,
        side: BorderSide.none,
        child: Icon(
          Icons.menu,
          color: ManagerColors.black,
          size: ManagerIconsSizes.i30,
        ),
      ),
    ],
  );
}
