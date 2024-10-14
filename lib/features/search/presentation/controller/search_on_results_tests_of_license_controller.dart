import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final TestResultDatabaseController _testResultDatabase =
      instance<TestResultDatabaseController>();

  late TextEditingController idNumberController;
  late String resultName;

  late bool licenseTestResults;

  late bool practicalTestResult;

  bool loading = false;
  bool result = false;

  late String driverName;

  late String driverImage;

  @override
  void onInit() {
    super.onInit();
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
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

  void searchButton() async {
    loading = true;
    if (_checkData()) {
      TestResultModel? testResult =
          await _testResultDatabase.show(idNumberController.text);
      if (testResult != null) {
        result = true;
        resultName = testResult.studentName;
        practicalTestResult =
            testResult.practicalTestResults == 0 ? false : true;
        licenseTestResults = testResult.licenseTestResults == 0 ? false : true;
      }
    }
    loading = false;
    update();
  }

  bool _checkData() {
    if (idNumberController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
