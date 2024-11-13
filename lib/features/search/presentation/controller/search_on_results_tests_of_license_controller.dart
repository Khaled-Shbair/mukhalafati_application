import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController
    with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SearchOnResultsTestsOfLicenseUseCase _useCase =
      instance<SearchOnResultsTestsOfLicenseUseCase>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late TextEditingController idNumber;
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
    idNumber = TextEditingController();
  }

  @override
  void dispose() {
    idNumber.dispose();
    super.dispose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton() async {
    loading = true;
    result = false;
    update();

    if (_checkData()) {
      (await _useCase.execute(
        SearchOnResultsTestsOfLicenseUseCaseInput(idNumber: idNumber.text),
      ))
          .fold(
        (l) {
          result = false;
          loading = false;
          showSnackBar(message: l.message);
          update();
        },
        (r) {
          resultName = r.studentName;
          practicalTestResult = r.practicalTestResult;
          licenseTestResults = r.licenseTestResults;
          loading = false;
          result = true;
          update();
        },
      );
    }
  }

  bool _checkData() {
    if (idNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
