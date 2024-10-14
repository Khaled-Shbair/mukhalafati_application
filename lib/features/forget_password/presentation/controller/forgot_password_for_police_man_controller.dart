import '/config/all_imports.dart';

class ForgotPasswordForPoliceManController extends GetxController with Helpers {
  late TextEditingController jobNumber;

  final PoliceDatabaseController _policeDatabase =
      instance<PoliceDatabaseController>();

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

  void sendButton() async {
    if (_checkDataDriver()) {
      PoliceModel? police = await _policeDatabase.show(jobNumber.text);
      if (police != null) {
        String phoneNumber = police.policePhoneNumber;
        phoneNumber =
            // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
            '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';
        Get.toNamed(
          Routes.verificationCodeScreen,
          arguments: [phoneNumber, police.policeId, true],
        );
      } else {
        showSnackBar(message: ManagerStrings.licenseNumberNotFound);
      }
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
