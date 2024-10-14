import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  final ViolationsDatabaseController _violationsDatabase =
      ViolationsDatabaseController();

  late String driverName;
  late String driverImage;
  late String driverFirstName;

  String welcome = ManagerStrings.goodMorning;
  late int counterOfNotification;
  late int unPaidViolation;

  late int paidViolation;

  @override
  void onInit() async {
    super.onInit();
    paidViolation = await _violationsDatabase
        .numberOfViolationsUnPaid(_sharedPreferences.getUserId());
    counterOfNotification = _sharedPreferences.getNumberOfUnReadNotifications();
    unPaidViolation = _sharedPreferences.getNumberOfViolationsUnPaid();
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
    changeWelcome();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void changeWelcome() {
    if (DateTime.now().hour >= 12) {
      welcome = ManagerStrings.goodEvening;
    } else {
      welcome = ManagerStrings.goodMorning;
    }
    update();
  }

  void notificationButton() {
    Get.toNamed(Routes.notificationScreen);
  }
}
