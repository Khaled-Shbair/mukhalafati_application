import '/config/all_imports.dart';

class CustomDriverDrawer extends StatelessWidget {
  const CustomDriverDrawer({
    this.isListOfComplaintsScreen = false,
    this.isDriverHomeScreen = false,
    this.isProfileScreen = false,
    this.isDrivingLicenseCardScreen = false,
    this.isSearchForDriverScreen = false,
    this.isSearchOnResultsTestsOfLicenseScreen = false,
    this.isPayViolationsScreen = false,
    super.key,
  });

  final bool isListOfComplaintsScreen;

  final bool isDriverHomeScreen;

  final bool isProfileScreen;

  final bool isDrivingLicenseCardScreen;

  final bool isSearchForDriverScreen;

  final bool isSearchOnResultsTestsOfLicenseScreen;

  final bool isPayViolationsScreen;

  @override
  Widget build(BuildContext context) {
    return CustomMainDrawer(
      children: [
        DrawerHeader(
          margin: EdgeInsetsDirectional.only(bottom: ManagerHeight.h8),
          padding: EdgeInsetsDirectional.only(bottom: ManagerHeight.h10),
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            image: DecorationImage(
              image: AssetImage(ManagerAssets.backgroundDrawerImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w10,
              end: ManagerWidth.w10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: ManagerRadius.r40,
                    backgroundImage: customCachedNetworkImageProvider(
                      SharedPreferencesController.getString(
                          SharedPreferencesKeys.image),
                    ),
                    backgroundColor: context.theme.colorScheme.surface,
                  ),
                ),
                horizontalSpace(ManagerWidth.w6),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${ManagerStrings.theDriver}: ${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}',
                    style: context.textTheme
                        .logoutAndCreateComplaintAndNameDriverButton(context),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: context.theme.primaryColor,
          height: ManagerHeight.h1,
        ),
        verticalSpace(ManagerHeight.h15),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isDriverHomeScreen) {
              Get.back();
            } else {
              context.popAndPushNamed(Routes.driverHomeScreen);
              disposeDriverProfile();
              disposeLogout();
              disposeNotification();
              disposeDrivingLicenseCard();
              disposeListOfComplaints();
              disposeViolationPayment();
              disposeSearchOnResultsTestsOfLicense();
            }
          },
          icon: ManagerAssets.homeIcon,
          title: ManagerStrings.homePage,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isProfileScreen) {
              Get.back();
            } else {
              context.popAndPushNamed(Routes.driverProfileScreen);
              disposeLogout();
              disposeNotification();
              disposeDrivingLicenseCard();
              disposeListOfComplaints();
              disposeViolationPayment();
              disposeSearchOnResultsTestsOfLicense();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.userProfileIcon,
          title: ManagerStrings.profile,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isSearchOnResultsTestsOfLicenseScreen) {
              Get.back();
            } else {
              context
                  .popAndPushNamed(Routes.searchOnResultsTestsOfLicenseScreen);
              disposeDriverProfile();
              disposeNotification();
              disposeLogout();
              disposeDrivingLicenseCard();
              disposeListOfComplaints();
              disposeViolationPayment();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.resultOfTextLicenseIcon,
          title: ManagerStrings.licenseTestResults,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isPayViolationsScreen) {
              Get.back();
            } else {
              context.popAndPushNamed(Routes.violationPaymentScreen);
              disposeDriverProfile();
              disposeLogout();
              disposeNotification();
              disposeDrivingLicenseCard();
              disposeListOfComplaints();
              disposeSearchOnResultsTestsOfLicense();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.paymentIcon,
          title: ManagerStrings.payViolations,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isListOfComplaintsScreen) {
              Get.back();
            } else {
              context.popAndPushNamed(Routes.listOfComplaintsScreen);
              disposeDriverProfile();
              disposeLogout();
              disposeNotification();
              disposeDrivingLicenseCard();
              disposeViolationPayment();
              disposeSearchOnResultsTestsOfLicense();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.listOfComplaintsIcon,
          title: ManagerStrings.listOfComplaints,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            if (isDrivingLicenseCardScreen) {
              Get.back();
            } else {
              context.popAndPushNamed(Routes.drivingLicenseCardScreen);
              disposeDriverProfile();
              disposeLogout();
              disposeNotification();
              disposeListOfComplaints();
              disposeViolationPayment();
              disposeSearchOnResultsTestsOfLicense();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.drivingLicenseIcon,
          title: ManagerStrings.electronicLicense,
        ),
        CustomButtonOfMainDrawer(
          onPressed: () {
            Get.toNamed(Routes.logoutScreen);
            disposeDriverProfile();
            disposeDrivingLicenseCard();
            disposeListOfComplaints();
            disposeViolationPayment();
            disposeNotification();
            disposeSearchOnResultsTestsOfLicense();
            disposeDriverHome();
          },
          icon: ManagerAssets.logoutIcon,
          title: ManagerStrings.logout,
        ),
      ],
    );
  }
}
