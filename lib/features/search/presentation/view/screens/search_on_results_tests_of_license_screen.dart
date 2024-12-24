import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseScreen extends StatelessWidget {
  const SearchOnResultsTestsOfLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOnResultsTestsOfLicenseController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.licenseTestResults),
            actions: [
              menuButton(() => controller.openEndDrawer()),
            ],
          ),
          endDrawer:
              CustomDriverDrawer(isSearchOnResultsTestsOfLicenseScreen: true),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w5,
                    top: ManagerHeight.h4,
                    bottom: ManagerHeight.h4,
                  ),
                  decoration: BoxDecoration(
                    /////////////////////////////////////////////////
                    color: context.theme.colorScheme.onPrimaryContainer,
                    /////////////////////////////////////////////////
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: Row(
                    children: [
                      CustomButton(
                        onPressed: () => controller.searchButton(context),
                        minWidth: ManagerWidth.w24,
                        height: ManagerHeight.h24,
                        backgroundColor:  context.theme.unselectedWidgetColor,
                        highlightColor: context.theme.unselectedWidgetColor,
                        side: BorderSide.none,
                        child: SvgPicture.asset(ManagerAssets.searchIcon),
                        padding: EdgeInsetsDirectional.zero,
                      ),
                      Expanded(
                        child: CustomTextField(
                          contentPadding: EdgeInsetsDirectional.zero,
                          controller: controller.idNumber,
                          hintText: ManagerStrings.idNumber,
                          /////////////////////////////////////////////////
                          //TODO:
                          // color: context.theme.colorScheme.onPrimaryContainer,
                          color: context.theme.unselectedWidgetColor,
                          //TODO:
                          // borderColor: context.theme.colorScheme.outline,
                          borderColor: context.theme.unselectedWidgetColor,
                          /////////////////////////////////////////////////
                          maxLength: AppConstants.maxLengthOfIDNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.loading == true) ...{
                  Spacer(),
                  CustomLoading(),
                  Spacer(),
                } else if (controller.result == true &&
                    controller.loading == false) ...{
                  resultOfLicense(
                    resultName: controller.resultName,
                    statusLicenseTest: controller.licenseTestResults,
                    statusPracticalTest: controller.practicalTestResult,
                  ),
                } else ...{
                  emptyResult(
                    text: ManagerStrings.searchForLicenseResultsUsingIdNumber,
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
