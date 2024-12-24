import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseController extends GetxController
    with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SearchOnResultsTestsOfLicenseUseCase _useCase =
      instance<SearchOnResultsTestsOfLicenseUseCase>();

  late TextEditingController idNumber;

  late String resultName;

  late bool licenseTestResults;

  late bool practicalTestResult;

  bool loading = false;
  bool result = false;

  @override
  void onInit() {
    super.onInit();
    idNumber = TextEditingController();
  }

  @override
  void onClose() {
    idNumber.dispose();
    super.onClose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void searchButton(BuildContext context) async {
    loading = true;
    result = false;
    update();

    if (_checkData()) {
      (await _useCase.execute(
        SearchOnResultsTestsOfLicenseUseCaseInput(idNumber: idNumber.text),
      ))
          .fold(
        /// Failed request search on results tests of license
        (l) {
          result = false;
          loading = false;

          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: context);
          update();
        },

        /// Successfully request search on results tests of license
        (r) {
          resultName = r.studentName;
          practicalTestResult = r.practicalTestResult;
          licenseTestResults = r.licenseTestResults;
          loading = false;
          result = true;
          update();
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showSnackBar(
          message: ManagerStrings.pleaseEnterIdNumber, context: context);
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
