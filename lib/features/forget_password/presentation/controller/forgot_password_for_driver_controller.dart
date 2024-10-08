import '/config/all_imports.dart';

class ForgotPasswordForDriverController extends GetxController with Helpers {
  final DriverDatabaseController _driverDatabase =
      instance<DriverDatabaseController>();
  late TextEditingController licenseNumber;

  @override
  void onInit() {
    super.onInit();
    licenseNumber = TextEditingController();
  }

  @override
  void dispose() {
    licenseNumber.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
    disposeForgotPasswordForDriver();
  }

  void sendButton() async {
    if (_checkDataDriver()) {
      DriverModel? driver = await _driverDatabase.getDriver(licenseNumber.text);
      if (driver != null) {
        String phoneNumber = driver.phone;
        phoneNumber =
            // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
            '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';
        Get.toNamed(
          Routes.verificationCodeScreen,
          arguments: [phoneNumber, driver.driverId, false],
        );
      } else {
        showSnackBar(message: ManagerStrings.licenseNumberNotFound);
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkDataDriver() {
    if (licenseNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
