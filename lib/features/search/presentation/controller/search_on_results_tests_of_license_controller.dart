import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController idNumberController;
  String resultName = 'خالد عبد المنعم عثمان شبير';
  bool licenseTestResults = true;
  bool practicalTestResult = false;
  bool loading = false;
  bool result = true;
  String driverName = 'خالد شبير';
  String driverImage =
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg';

  @override
  void onInit() {
    super.onInit();
    idNumberController = TextEditingController();
  }

  @override
  void onClose() {
    idNumberController.dispose();
    super.onClose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }
  void searchButton() {}
}
