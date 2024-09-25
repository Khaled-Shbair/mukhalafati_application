import '/config/all_imports.dart';

Widget driverDrawer({
  bool isListOfComplaintsScreen = false,
  bool isDriverHomeScreen = false,
  bool isProfileScreen = false,
  bool isDrivingLicenseCardScreen = false,
  bool isSearchForDriverScreen = false,
  bool isSearchOnResultsTestsOfLicenseScreen = false,
  bool isPayViolationsScreen = false,
  required String driverName,
  required String driverImage,
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
              backgroundImage: NetworkImage(driverImage),
            ),
            SizedBox(width: ManagerWidth.w10),
            Text(
              '${ManagerStrings.theDriver}: $driverName',
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
      Divider(
        color: ManagerColors.primaryColor,
        height: ManagerHeight.h1,
      ),
      SizedBox(height: ManagerHeight.h15),
      buttonOfMyDrawer(
        onPressed: () {
          if (isDriverHomeScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.driverHomeScreen);
          }
        },
        icon: ManagerAssets.homeIcon,
        title: ManagerStrings.homePage,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isProfileScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.driverProfileScreen);
          }
        },
        icon: ManagerAssets.userProfileIcon,
        title: ManagerStrings.profile,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isSearchOnResultsTestsOfLicenseScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.searchOnResultsTestsOfLicenseScreen);
          }
        },
        icon: ManagerAssets.resultOfTextLicenseIcon,
        title: ManagerStrings.licenseTestResults,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isPayViolationsScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.payViolationsScreen);
          }
        },
        icon: ManagerAssets.paymentIcon,
        title: ManagerStrings.payViolations,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isListOfComplaintsScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.listOfComplaintsScreen);
          }
        },
        icon: ManagerAssets.listOfComplaintsIcon,
        title: ManagerStrings.listOfComplaints,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          if (isDrivingLicenseCardScreen) {
            Get.back();
          } else {
            Get.offAndToNamed(Routes.drivingLicenseCardScreen);
          }
        },
        icon: ManagerAssets.drivingLicenseIcon,
        title: ManagerStrings.electronicLicense,
      ),
      buttonOfMyDrawer(
        onPressed: () {
          Get.toNamed(Routes.logoutScreen);
        },
        icon: ManagerAssets.logoutIcon,
        title: ManagerStrings.logout,
      ),
    ],
  );
}
