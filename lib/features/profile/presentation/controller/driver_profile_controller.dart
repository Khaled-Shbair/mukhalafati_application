import '/config/all_imports.dart';

class DriverProfileController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late String driverImage;

  late TextEditingController driverNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController idNumberController;
  late TextEditingController licenceNumberController;

  @override
  void onInit() {
    super.onInit();

    driverImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);

    driverNameController = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.fullNameAr));
    phoneNumberController = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.phoneNumber));
    idNumberController = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.idNumber));
    licenceNumberController = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.licenseOrJobNumber));
  }

  @override
  void onClose() {
    driverNameController.dispose();
    phoneNumberController.dispose();
    idNumberController.dispose();
    licenceNumberController.dispose();
    super.onClose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// Driver send request to update profile data when see error in data
  void updateDataButton() {
    if (_checkDataDriver()) {
      createdSuccessfullyDialog(
        closeButton: () {
          /// Remove driver profile controller form memory
          disposeDriverProfile();

          /// Navigate to driver home screen
          Get.offAllNamed(Routes.driverHomeScreen);
        },
        context: Get.context!,
        text: ManagerStrings.yourUpdateRequestHasBeenSubmittedSuccessfully,
        startPaddingText: ManagerWidth.w28,
        endPaddingText: ManagerWidth.w28,
        fontSizeText: ManagerFontsSizes.f16,
      );
    } else {}
  }

  /// check inputs user data in not empty and not similar previous data
  bool _checkDataDriver() {
    if (driverNameController.text.isNotEmpty &&
            phoneNumberController.text.isNotEmpty &&
            idNumberController.text.isNotEmpty &&
            licenceNumberController.text.isNotEmpty &&
            driverNameController.text !=
                SharedPreferencesController.getString(
                    SharedPreferencesKeys.fullNameAr) ||
        phoneNumberController.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.phoneNumber) ||
        idNumberController.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.idNumber) ||
        licenceNumberController.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.licenseOrJobNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
