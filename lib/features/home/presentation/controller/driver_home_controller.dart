import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late String driverFirstName;

  String welcome = ManagerStrings.goodMorning;
  late int counterOfNotification;
  late int unPaidViolation;

  late int paidViolation;
  bool loading = false;

  @override
  void onInit() async {
    super.onInit();
    paidViolation = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfViolationsPaid);

    counterOfNotification = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfUnReadNotifications);

    unPaidViolation = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfUnReadNotifications);

    driverFirstName =
        SharedPreferencesController.getString(SharedPreferencesKeys.firstName);

    changeWelcome();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// Change the hello word based on time [goodEvening] and [goodMorning]
  void changeWelcome() {
    if (DateTime.now().hour >= 12) {
      welcome = ManagerStrings.goodEvening;
    } else {
      welcome = ManagerStrings.goodMorning;
    }
    update();
  }

  /// Navigate to [NotificationScreen]
  void notificationButton() {
    Get.toNamed(Routes.notificationScreen);
  }
}
