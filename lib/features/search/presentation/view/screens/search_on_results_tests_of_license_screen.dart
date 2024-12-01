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
            title: Text(
              ManagerStrings.licenseTestResults,
            ),
            actions: [
              mainButton(
                onPressed: () => controller.openEndDrawer(),
                minWidth: ManagerWidth.w30,
                height: ManagerHeight.h30,
                color: ManagerColors.transparent,
                highlightColor: ManagerColors.transparent,
                splashColor: ManagerColors.transparent,
                side: BorderSide.none,
                child: Icon(
                  Icons.menu,
                  color: ManagerColors.black,
                  size: ManagerIconsSizes.i30,
                ),
              ),
            ],
          ),
          endDrawer: driverDrawer(
            isSearchOnResultsTestsOfLicenseScreen: true,
            driverImage: controller.driverImage,
            driverName: controller.driverName,
          ),
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
                    color: ManagerColors.lotion,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: Row(
                    children: [
                      mainButton(
                        onPressed: () => controller.searchButton(),
                        minWidth: ManagerWidth.w24,
                        height: ManagerHeight.h24,
                        color: ManagerColors.transparent,
                        highlightColor: ManagerColors.transparent,
                        side: BorderSide.none,
                        child: SvgPicture.asset(ManagerAssets.searchIcon),
                        padding: EdgeInsetsDirectional.zero,
                      ),
                      Expanded(
                        child: mainTextField(
                          contentPadding: EdgeInsetsDirectional.zero,
                          controller: controller.idNumber,
                          hintText: ManagerStrings.idNumber,
                          color: ManagerColors.lotion,
                          borderColor: ManagerColors.lotion,
                          maxLength: AppConstants.maxLengthOfIDNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.loading == true) ...{
                  Spacer(),
                  myLoading(),
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
