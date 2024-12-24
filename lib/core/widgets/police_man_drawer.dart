import '/config/all_imports.dart';

class PoliceManDrawer extends StatelessWidget {
  const PoliceManDrawer({
    this.isPoliceManHomeScreen = false,
    this.isCreateViolationScreen = false,
    this.isSearchForDriverScreen = false,
    this.isListOfViolationsScreen = false,
    super.key,
  });

  final bool isPoliceManHomeScreen;
  final bool isCreateViolationScreen;
  final bool isSearchForDriverScreen;
  final bool isListOfViolationsScreen;

  @override
  Widget build(BuildContext context) {
    return CustomMainDrawer(
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
                backgroundImage: customCachedNetworkImageProvider(
                  SharedPreferencesController.getString(
                      SharedPreferencesKeys.image),
                ),
              ),
              SizedBox(width: ManagerWidth.w10),
              Text(
                '${ManagerStrings.thePolice}: ${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}',
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
        CustomButtonOfMainDrawer(
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
        CustomButtonOfMainDrawer(
          onPressed: () {},
          icon: ManagerAssets.radarIcon,
          title: ManagerStrings.speedMonitor,
        ),
        CustomButtonOfMainDrawer(
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
        CustomButtonOfMainDrawer(
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
        CustomButtonOfMainDrawer(
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
        CustomButtonOfMainDrawer(
          onPressed: () {
            Get.toNamed(Routes.logoutScreen, arguments: true);
          },
          icon: ManagerAssets.logoutIcon,
          title: ManagerStrings.logout,
        ),
      ],
    );
  }
}
