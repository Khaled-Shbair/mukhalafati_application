import '/config/all_imports.dart';

Widget policeManDrawer({
  bool isPoliceManHomeScreen = false,
  bool isCreateViolationScreen = false,
  bool isSearchForDriverScreen = false,
  bool isListOfViolationsScreen = false,
}) {
  return mainDrawer(
    children: [
      SizedBox(height: ManagerHeight.h70),
      Image.asset(
        ManagerAssets.logo,
        height: ManagerHeight.h55,
        width: ManagerWidth.w66,
      ),
      SizedBox(height: ManagerHeight.h28),
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
      SizedBox(height: ManagerHeight.h20),
      buttonOfMyDrawer(
        onPressed: () {
          debugPrint('Open camera: Radar');
        },
        icon: ManagerAssets.radarIcon,
        title: ManagerStrings.speedMonitor,
        widthIcon: ManagerWidth.w22,
        heightIcon: ManagerHeight.h22,
      ),
      SizedBox(height: ManagerHeight.h20),
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
      SizedBox(height: ManagerHeight.h20),
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
        widthIcon: ManagerWidth.w22,
        heightIcon: ManagerHeight.h22,
      ),
      SizedBox(height: ManagerHeight.h20),
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
        widthIcon: ManagerWidth.w24,
        heightIcon: ManagerHeight.h24,
      ),
      SizedBox(height: ManagerHeight.h20),
      buttonOfMyDrawer(
        onPressed: () {
          Get.toNamed(Routes.logoutScreen);
        },
        icon: ManagerAssets.logoutIcon,
        title: ManagerStrings.logout,
        widthIcon: ManagerWidth.w22,
        heightIcon: ManagerHeight.h22,
      ),
    ],
  );
}
