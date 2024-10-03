import '/config/all_imports.dart';

class ForgotPasswordForPoliceManController extends GetxController with Helpers {
  late TextEditingController jobNumber;

  @override
  void onInit() {
    super.onInit();
    jobNumber = TextEditingController();
  }

  @override
  void dispose() {
    jobNumber.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
    disposeForgotPasswordForPoliceMan();
  }


  void sendButton() {
    //TODO: Later Edit phone number get from Api
    if (_checkDataDriver()) {
      String phoneNumber = '0599724037';
      phoneNumber =
          // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
          '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';
      Get.toNamed(
        Routes.verificationCodeScreen,
        arguments: phoneNumber,
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
  }

  bool _checkDataDriver() {
    if (jobNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
