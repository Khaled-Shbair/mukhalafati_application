import '/config/all_imports.dart';

class DriverProfileController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        '${SharedPreferencesController.getString(SharedPreferencesKeys.firstName)} ${SharedPreferencesController.getString(SharedPreferencesKeys.lastName)}';

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
