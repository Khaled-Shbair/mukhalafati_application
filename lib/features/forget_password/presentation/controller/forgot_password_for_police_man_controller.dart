import '/config/all_imports.dart';

class ForgotPasswordForPoliceManController extends GetxController with Helpers {
  late TextEditingController jobNumber;
  final PoliceManForgotPasswordUseCase _useCase =
      instance<PoliceManForgotPasswordUseCase>();

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
      (await _useCase.execute(
              PoliceManForgotPasswordUseCaseInput(jobNumber: jobNumber.text)))
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
              r.policeManId,
              true,
              0000,
            ],
          );
        },
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterJobNumber);
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
