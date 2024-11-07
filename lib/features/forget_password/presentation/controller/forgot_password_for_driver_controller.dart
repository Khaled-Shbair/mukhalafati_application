import '/config/all_imports.dart';

class ForgotPasswordForDriverController extends GetxController with Helpers {
  final DriverForgotPasswordUseCase _useCase =
      instance<DriverForgotPasswordUseCase>();
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
      (await _useCase.execute(DriverForgotPasswordUseCaseInput(
              licenseNumber: licenseNumber.text)))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
        (r) {
          String phoneNumber = r.phoneNumber!;
          phoneNumber =
              // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
              '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';
          Get.toNamed(
            Routes.verificationCodeScreen,
            arguments: [
              phoneNumber,
              r.driverId,
              true,
              0000,
            ],
          );
        },
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterLicenseNumber);
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
