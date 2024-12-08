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
          endDrawer: policeManDrawer(
            isSearchForDriverScreen: true,
            policeImage: controller.policeImage,
            policeName: controller.policeName,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.vehicleDrivers),
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
                        child: MainTextField(
                          contentPadding: EdgeInsetsDirectional.zero,
                          controller: controller.licenseNumberController,
                          hintText: ManagerStrings.licenseNumber,
                          color: ManagerColors.lotion,
                          borderColor: ManagerColors.lotion,
                          maxLength: AppConstants.maxLengthOfLicenseNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.loading == true) ...{
                  myLoading(),
                } else if (controller.result) ...{
                  SizedBox(height: ManagerHeight.h24),
                  resultOfDriver(
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
