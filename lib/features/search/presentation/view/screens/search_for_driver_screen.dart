import '/config/all_imports.dart';

class SearchForDriverScreen extends StatelessWidget {
  const SearchForDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchForDriverController>(
      builder: (controller) {
        return CustomTemplateSearchScreen(
          focusNode: controller.focusNode,
          scaffoldKey: controller.scaffoldKey,
          endDrawer: CustomPoliceManDrawer(isSearchForDriverScreen: true),
          titleAppBar: ManagerStrings.vehicleDrivers,
          menuButtonControl: controller.openEndDrawer,
          searchButton: controller.searchButton,
          textController: controller.licenseNumberController,
          hintTextFiled: ManagerStrings.licenseNumber,
          maxLengthInput: AppConstants.maxLengthOfLicenseNumber,
          loading: controller.loading,
          resultStatus: controller.result,
          textOfEmptyResult:
              ManagerStrings.searchForASpecificDriverUsingTheLicenseNumber,
          resultWidget: CustomResultOfDriver(
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
        );
      },
    );
  }
}
