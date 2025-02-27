import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseScreen extends StatelessWidget {
  const SearchOnResultsTestsOfLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOnResultsTestsOfLicenseController>(
      builder: (controller) {
        return CustomTemplateSearchScreen(
          focusNode: controller.focusNode,
          scaffoldKey: controller.scaffoldKey,
          titleAppBar: ManagerStrings.licenseTestResults,
          menuButtonControl: controller.openEndDrawer,
          searchButton: controller.searchButton,
          resultStatus: controller.result,
          loading: controller.loading,
          maxLengthInput: AppConstants.maxLengthOfIDNumber,
          textController: controller.idNumber,
          hintTextFiled: ManagerStrings.idNumber,
          textOfEmptyResult:
              ManagerStrings.searchForLicenseResultsUsingIdNumber,
          resultWidget: resultOfLicense(
            resultName: controller.resultName,
            statusLicenseTest: controller.licenseTestResults,
            statusPracticalTest: controller.practicalTestResult,
          ),
          endDrawer:
              CustomDriverDrawer(isSearchOnResultsTestsOfLicenseScreen: true),
        );
      },
    );
  }
}
