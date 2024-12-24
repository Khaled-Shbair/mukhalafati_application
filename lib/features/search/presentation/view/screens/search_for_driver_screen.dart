import '/config/all_imports.dart';

class SearchForDriverScreen extends StatelessWidget {
  const SearchForDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchForDriverController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: PoliceManDrawer(isSearchForDriverScreen: true),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.vehicleDrivers),
            actions: [
              menuButton(() => controller.openEndDrawer()),
            ],
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
                    /////////////////////////////////////////////////
                    //TODO:
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
                        backgroundColor: context.theme.unselectedWidgetColor,
                        highlightColor: context.theme.unselectedWidgetColor,
                        side: BorderSide.none,
                        padding: EdgeInsetsDirectional.zero,
                        child: SvgPicture.asset(ManagerAssets.searchIcon),
                      ),
                      Expanded(
                        child: CustomTextField(
                          contentPadding: EdgeInsetsDirectional.zero,
                          controller: controller.licenseNumberController,
                          hintText: ManagerStrings.licenseNumber,
                          /////////////////////////////////////////////////
                          //TODO:
                          // color: context.theme.colorScheme.onPrimaryContainer,
                          color: context.theme.unselectedWidgetColor,
                          //TODO:
                          // borderColor: context.theme.colorScheme.outline,
                          borderColor: context.theme.unselectedWidgetColor,
                          /////////////////////////////////////////////////
                          maxLength: AppConstants.maxLengthOfLicenseNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.loading == true) ...{
                  CustomLoading(),
                } else if (controller.result) ...{
                  SizedBox(height: ManagerHeight.h24),
                  resultOfDriver(
                    context: context,
                    licenseNumber: controller.licenseNumber,
                    nameAr: controller.nameAr,
                    nameEn: controller.nameEn,
                    idNumber: controller.idNumber,
                    releaseDate: controller.releaseDate,
                    expiryDate: controller.expiryDate,
                    licenseLevels: controller.licenseLevels,
                    imageDriver: controller.imageDriver,
                    numberOfViolations: controller.numberOfViolations,
                  ),
                } else ...{
                  emptyResult(
                    text: ManagerStrings
                        .searchForASpecificDriverUsingTheLicenseNumber,
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
