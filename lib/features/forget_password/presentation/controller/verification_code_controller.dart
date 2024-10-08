import '/config/all_imports.dart';

class VerificationCodeController extends GetxController {
  late TextEditingController oneNumberOfCode;
  late TextEditingController twoNumberOfCode;
  late TextEditingController threeNumberOfCode;
  late TextEditingController fourNumberOfCode;
  late FocusNode oneFocusNode;
  late FocusNode twoFocusNode;
  late FocusNode threeFocusNode;
  late FocusNode fourFocusNode;
  bool changeBorderColorOneFiled = false;
  bool changeBorderColorTwoFiled = false;
  bool changeBorderColorThreeFiled = false;
  bool changeBorderColorFourFiled = false;

  bool returnCodeIsInCorrect = false;

  @override
  void onInit() {
    super.onInit();
    oneNumberOfCode = TextEditingController();
    twoNumberOfCode = TextEditingController();
    threeNumberOfCode = TextEditingController();
    fourNumberOfCode = TextEditingController();
    oneFocusNode = FocusNode();
    twoFocusNode = FocusNode();
    threeFocusNode = FocusNode();
    fourFocusNode = FocusNode();
  }

  @override
  void dispose() {
    oneNumberOfCode.dispose();
    twoNumberOfCode.dispose();
    threeNumberOfCode.dispose();
    fourNumberOfCode.dispose();
    oneFocusNode.dispose();
    twoFocusNode.dispose();
    threeFocusNode.dispose();
    fourFocusNode.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
    disposeVerificationCode();
  }

  void verifyButton(int id, bool isDriver) {
    if (_checkDataDriver()) {
      Get.offAndToNamed(
        Routes.changePasswordScreen,
        arguments: [id, isDriver],
      );
    } else {
      returnCodeIsInCorrect = true;
      Future.delayed(
        const Duration(seconds: 3),
        () {
          returnCodeIsInCorrect = false;
          update();
        },
      );
    }
    update();
  }

  void onChangeOneFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorOneFiled = true;
      twoFocusNode.requestFocus();
    } else {
      changeBorderColorOneFiled = false;
    }
    update();
  }

  void onChangeTwoFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorTwoFiled = true;
      threeFocusNode.requestFocus();
    } else {
      changeBorderColorTwoFiled = false;
      oneFocusNode.requestFocus();
    }
    update();
  }

  void onChangeThreeFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorThreeFiled = true;
      fourFocusNode.requestFocus();
    } else {
      changeBorderColorThreeFiled = false;
      twoFocusNode.requestFocus();
    }
    update();
  }

  void onChangeFourFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorFourFiled = true;
    } else {
      changeBorderColorFourFiled = false;
      threeFocusNode.requestFocus();
    }
    update();
  }

  bool _checkDataDriver() {
    if (oneNumberOfCode.text.isNotEmpty &&
        twoNumberOfCode.text.isNotEmpty &&
        threeNumberOfCode.text.isNotEmpty &&
        fourNumberOfCode.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
