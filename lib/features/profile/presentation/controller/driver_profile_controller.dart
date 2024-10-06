import '/config/all_imports.dart';

class DriverProfileController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();

  late String driverName;

  late String driverImage;

  late TextEditingController driverNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController idNumberController;
  late TextEditingController licenceNumberController;

  @override
  void onInit() {
    super.onInit();
    driverName = _sharedPreferences.firstName();
    driverImage = _sharedPreferences.image();
    driverNameController =
        TextEditingController(text: _sharedPreferences.fullName());
    phoneNumberController =
        TextEditingController(text: _sharedPreferences.phoneNumber());
    idNumberController =
        TextEditingController(text: _sharedPreferences.idNumber());
    licenceNumberController =
        TextEditingController(text: _sharedPreferences.licenseNumber());
  }

  @override
  void dispose() {
    driverNameController.dispose();
    phoneNumberController.dispose();
    idNumberController.dispose();
    licenceNumberController.dispose();
    super.dispose();
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void updateDataButton() {
    if (_checkDataDriver()) {
      createdSuccessfullyDialog(
        closeButton: () => Get.offAllNamed(Routes.driverHomeScreen),
        context: Get.context!,
        text: ManagerStrings.yourUpdateRequestHasBeenSubmittedSuccessfully,
        startPaddingText: ManagerWidth.w28,
        endPaddingText: ManagerWidth.w28,
        fontSizeText: ManagerFontsSizes.f16,
      );
    } else {}
  }

  bool _checkDataDriver() {
    if (driverNameController.text.isNotEmpty &&
            phoneNumberController.text.isNotEmpty &&
            idNumberController.text.isNotEmpty &&
            licenceNumberController.text.isNotEmpty &&
            driverNameController.text != _sharedPreferences.fullName() ||
        phoneNumberController.text != _sharedPreferences.phoneNumber() ||
        idNumberController.text != _sharedPreferences.idNumber() ||
        licenceNumberController.text != _sharedPreferences.licenseNumber()) {
      return true;
    } else {
      return false;
    }
  }
}
