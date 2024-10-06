import '/config/all_imports.dart';

Widget policeManDrawer({
  bool isPoliceManHomeScreen = false,
  bool isCreateViolationScreen = false,
  bool isSearchForDriverScreen = false,
  bool isListOfViolationsScreen = false,
  required String policeName,
  required String policeImage,
}) {
  return mainDrawer(
    children: [
      DrawerHeader(
        margin: EdgeInsetsDirectional.only(bottom: ManagerHeight.h8),
        padding: EdgeInsetsDirectional.only(bottom: ManagerHeight.h10),
        decoration: const BoxDecoration(
          color: ManagerColors.primaryColor,
          image: DecorationImage(
            image: AssetImage(ManagerAssets.backgroundDrawerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: ManagerRadius.r40,
              backgroundImage: NetworkImage(policeImage),
            ),
            SizedBox(width: ManagerWidth.w10),
            Text(
              '${ManagerStrings.thePolice}: $policeName',
              style: TextStyle(
                color: ManagerColors.white,
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontsSizes.f14,
              ),
            ),
          ],
        ),
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isPoliceManHomeScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.policeManHomeScreen);
          }
        },
        icon: ManagerAssets.homeIcon,
        title: ManagerStrings.homePage,
      ),
      buttonOfMyDrawer(
        onPressed: () {},
        icon: ManagerAssets.radarIcon,
        title: ManagerStrings.speedMonitor,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isCreateViolationScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.createViolationScreen);
          }
        },
        icon: ManagerAssets.createIcon,
        title: ManagerStrings.createViolation,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isSearchForDriverScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.searchForDriverScreen);
          }
        },
        icon: ManagerAssets.searchForDriverIcon,
        title: ManagerStrings.searchOnDriver,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isListOfViolationsScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.listOfViolationsScreen);
          }
        },
        icon: ManagerAssets.listOfViolationIcon,
        title: ManagerStrings.listOfViolations,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          Get.toNamed(Routes.logoutScreen, arguments: true);
        },
        icon: ManagerAssets.logoutIcon,
        title: ManagerStrings.logout,
      ),
    ],
  );
}
