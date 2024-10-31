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
    driverName =
        '${_sharedPreferences.getFirstName()} ${_sharedPreferences.getLastName()}';
    driverImage = _sharedPreferences.getImage();
    driverNameController =
        TextEditingController(text: _sharedPreferences.getFullNameAr());
    phoneNumberController =
        TextEditingController(text: _sharedPreferences.getPhoneNumber());
    idNumberController =
        TextEditingController(text: _sharedPreferences.getIdNumber());
    licenceNumberController =
        TextEditingController(text: _sharedPreferences.getLicenseOrJobNumber());
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
        closeButton: () {
          disposeDriverProfile();
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

  bool _checkDataDriver() {
    if (driverNameController.text.isNotEmpty &&
            phoneNumberController.text.isNotEmpty &&
            idNumberController.text.isNotEmpty &&
            licenceNumberController.text.isNotEmpty &&
            driverNameController.text != _sharedPreferences.getFullNameAr() ||
        phoneNumberController.text != _sharedPreferences.getPhoneNumber() ||
        idNumberController.text != _sharedPreferences.getIdNumber() ||
        licenceNumberController.text !=
            _sharedPreferences.getLicenseOrJobNumber()) {
      return true;
    } else {
      return false;
    }
  }
}
