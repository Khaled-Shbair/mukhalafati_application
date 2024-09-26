import '/config/all_imports.dart';

class ForgotPasswordForDriverController extends GetxController {
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
    disposeForgotPasswordForPoliceMan();
  }

  void sendButton() {
    String number = '0599724037';
    number =
        // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
        '${number.characters.characterAt(8)}${number.characters.characterAt(9)}*****${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}';

    Get.toNamed(
      Routes.verificationCodeScreen,
      arguments: number,
    );
  }

  String phoneNumber(number) {
    return '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
  }
}
