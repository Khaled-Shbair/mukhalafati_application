import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late String driverName;

  late String driverImage;

  late String driverFirstName;

  String welcome = ManagerStrings.goodMorning;
  late int counterOfNotification;
  late int unPaidViolation;

  late int paidViolation;
  bool loading = false;

  @override
  void onInit() async {
    super.onInit();
    _data();
    changeWelcome();
  }

  void _data() {
    paidViolation = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfViolationsPaid);

    counterOfNotification = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfUnReadNotifications);

    unPaidViolation = SharedPreferencesController.getInt(
        SharedPreferencesKeys.numberOfUnReadNotifications);

    driverFirstName =
        SharedPreferencesController.getString(SharedPreferencesKeys.firstName);

    driverName =
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';
    driverImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);

    update();
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
