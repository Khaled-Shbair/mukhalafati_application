import '/config/all_imports.dart';

class DriverHomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  String driverFirstName = 'خالد';
  String welcome = ManagerStrings.goodMorning;
  int counterOfNotification = 9;
int unPaidViolation = 3;
int paidViolation = 3;
  @override
  void onInit() {
    super.onInit();
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
