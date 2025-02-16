import '/config/all_imports.dart';

PreferredSizeWidget customHomeAppBar({
  required String welcome,
  required String firstName,
  required Function() openEndDrawer,
  required Widget widget,
  required BuildContext context,
}) {
  return AppBar(
    leadingWidth: ManagerWidth.w199,
    toolbarHeight: ManagerHeight.h66,
    automaticallyImplyLeading: false,
    leading: Row(
      children: [
        horizontalSpace(ManagerWidth.w16),
        widget,
        horizontalSpace(ManagerWidth.w9),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              welcome,
              style: context.textTheme.textStyleOfWelcomeWord(context),
            ),
            Row(
              children: [
                Text(
                  firstName,
                  style: context.textTheme.textStyleOfNameOfUser(context),
                ),
                horizontalSpace(ManagerWidth.w4),
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
      CustomMenuButton(openEndDrawer),
    ],
  );
}
