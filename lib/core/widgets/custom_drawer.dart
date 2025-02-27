import '/config/all_imports.dart';

class CustomDriverDrawer extends StatelessWidget {
  CustomDriverDrawer({
    this.isListOfComplaintsScreen = false,
    this.isDriverHomeScreen = false,
    this.isProfileScreen = false,
    this.isDrivingLicenseCardScreen = false,
    this.isSearchForDriverScreen = false,
    this.isSearchOnResultsTestsOfLicenseScreen = false,
    this.isPayViolationsScreen = false,
    super.key,
  });

  final _sharedPrefController = instance<SharedPreferencesController>();
  final bool isListOfComplaintsScreen;

  final bool isDriverHomeScreen;

  final bool isProfileScreen;

  final bool isDrivingLicenseCardScreen;

  final bool isSearchForDriverScreen;

  final bool isSearchOnResultsTestsOfLicenseScreen;

  final bool isPayViolationsScreen;

  @override
  Widget build(BuildContext context) {
    return _CustomMainDrawer(
      image: _sharedPrefController.getString(SharedPreferencesKeys.image),
      name:
          '${ManagerStrings.theDriver}: ${FormatNameHelper.firstNameAndLastNameAr(_sharedPrefController.getString(SharedPreferencesKeys.nameAr))}',
      children: [
        Divider(
          color: context.theme.primaryColor,
          height: ManagerHeight.h1,
        ),
        verticalSpace(ManagerHeight.h15),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isDriverHomeScreen) {
              context.pop();
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
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isProfileScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.driverProfileScreen);
              disposeLogout();
              disposeNotification();
              disposeDrivingLicenseCard();
              disposeListOfComplaints();
              disposeViolationPayment();
              disposeSearchOnResultsTestsOfLicense();
              disposeDriverHome();
            }
          },
          icon: ManagerAssets.userIcon,
          title: ManagerStrings.profile,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isSearchOnResultsTestsOfLicenseScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(
                  Routes.searchOnResultsTestsOfLicenseScreen);
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
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isPayViolationsScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.violationPaymentScreen);
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
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isListOfComplaintsScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.listOfComplaintsScreen);
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
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isDrivingLicenseCardScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.drivingLicenseCardScreen);
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
        _CustomButtonOfMainDrawer(
          onPressed: () {
            context.pop();
            context.pushReplacementNamed(Routes.logoutScreen);
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

class CustomPoliceManDrawer extends StatelessWidget with CustomToast {
  CustomPoliceManDrawer({
    this.isPoliceManHomeScreen = false,
    this.isCreateViolationScreen = false,
    this.isSearchForDriverScreen = false,
    this.isListOfViolationsScreen = false,
    this.isRadarScreen = false,
    super.key,
  });

  final bool isPoliceManHomeScreen;
  final _sharedPrefController = instance<SharedPreferencesController>();
  final bool isCreateViolationScreen;
  final bool isSearchForDriverScreen;
  final bool isListOfViolationsScreen;
  final bool isRadarScreen;

  @override
  Widget build(BuildContext context) {
    return _CustomMainDrawer(
      image: _sharedPrefController.getString(SharedPreferencesKeys.image),
      name: '${ManagerStrings.thePolice}: '
          '${FormatNameHelper.firstNameAndLastNameAr(_sharedPrefController.getString(SharedPreferencesKeys.nameAr))}',
      children: [
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isPoliceManHomeScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.policeManHomeScreen);
              disposeSearchForDriver();
              disposeCreateViolation();
              disposeListOfViolations();
            }
          },
          icon: ManagerAssets.homeIcon,
          title: ManagerStrings.homePage,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (!isRadarScreen) {
              showToast(message: 'سيتم إضافتها قريبا...', context: context);
            } else {
              showToast(message: 'سيتم إضافتها قريبا...', context: context);
            }
          },
          icon: ManagerAssets.radarIcon,
          title: ManagerStrings.speedMonitor,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isCreateViolationScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.createViolationScreen);
              disposeSearchForDriver();
              disposePoliceManHome();
              disposeListOfViolations();
            }
          },
          icon: ManagerAssets.createIcon,
          title: ManagerStrings.createViolation,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isSearchForDriverScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.searchForDriverScreen);
              disposeCreateViolation();
              disposePoliceManHome();
              disposeListOfViolations();
            }
          },
          icon: ManagerAssets.searchForDriverIcon,
          title: ManagerStrings.searchOnDriver,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            if (isListOfViolationsScreen) {
              context.pop();
            } else {
              context.pop();
              context.pushReplacementNamed(Routes.listOfViolationsScreen);
              disposeSearchForDriver();
              disposeCreateViolation();
              disposePoliceManHome();
            }
          },
          icon: ManagerAssets.listOfViolationIcon,
          title: ManagerStrings.listOfViolations,
        ),
        _CustomButtonOfMainDrawer(
          onPressed: () {
            context.pop();
            context.pushNamed(Routes.logoutScreen, arguments: true);
          },
          icon: ManagerAssets.logoutIcon,
          title: ManagerStrings.logout,
        ),
      ],
    );
  }
}

class _CustomMainDrawer extends StatelessWidget {
  const _CustomMainDrawer({
    required this.children,
    required this.image,
    required this.name,
  });

  final List<Widget> children;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.drawerTheme.backgroundColor,
      width: context.theme.drawerTheme.width,
      shape: context.theme.drawerTheme.shape,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsetsDirectional.only(
              bottom: ManagerHeight.h10,
            ),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              image: DecorationImage(
                image: AssetImage(ManagerAssets.backgroundDrawerImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: CustomCachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                    height: ManagerHeight.h77,
                    width: ManagerWidth.w77,
                  ),
                ),
                horizontalSpace(ManagerWidth.w10),
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.textStyleOfNameInDrawer(context),
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _CustomButtonOfMainDrawer extends StatelessWidget {
  const _CustomButtonOfMainDrawer({
    required this.onPressed,
    required this.icon,
    required this.title,
  });

  final Function() onPressed;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Image.asset(
        icon,
        height: ManagerHeight.h24,
        width: ManagerWidth.w24,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: context.theme.listTileTheme.titleTextStyle,
      ),
      style: context.theme.listTileTheme.style,
      contentPadding: context.theme.listTileTheme.contentPadding,
    );
  }
}
