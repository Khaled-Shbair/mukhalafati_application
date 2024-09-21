import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController {
  late TextEditingController idNumberController;
  String resultName = 'خالد عبد المنعم عثمان شبير';
  bool licenseTestResults = true;
  bool practicalTestResult = false;
  bool loading = false;
  bool result = true;

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

  void searchButton() {}
}
