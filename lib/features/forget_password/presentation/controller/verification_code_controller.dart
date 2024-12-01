import '/config/all_imports.dart';

class VerificationCodeController extends GetxController with Helpers {
  late TextEditingController oneNumberOfCode;
  late TextEditingController twoNumberOfCode;
  late TextEditingController threeNumberOfCode;
  late TextEditingController fourNumberOfCode;
  late TextEditingController fiveNumberOfCode;
  late TextEditingController sexNumberOfCode;
  late FocusNode oneFocusNode;
  late FocusNode twoFocusNode;
  late FocusNode threeFocusNode;
  late FocusNode fourFocusNode;
  late FocusNode fiveFocusNode;
  late FocusNode sexFocusNode;
  bool changeBorderColorOneFiled = false;
  bool changeBorderColorTwoFiled = false;
  bool changeBorderColorThreeFiled = false;
  bool changeBorderColorFourFiled = false;
  bool changeBorderColorFiveFiled = false;
  bool changeBorderColorSexFiled = false;

  bool returnCodeIsInCorrect = false;
  late int _verificationCodeInput;
  final SendVerificationCodeUseCase _sendVerificationCodeUseCase =
      instance<SendVerificationCodeUseCase>();

  void sendVerificationCode(phoneNumber) async {
    (await _sendVerificationCodeUseCase.execute(
            SendVerificationInputCodeUseCase(phoneNumber: phoneNumber)))
        .fold(
      (l) {},
      (r) {},
    );
  }

  @override
  void onInit() {
    super.onInit();
    oneNumberOfCode = TextEditingController();
    twoNumberOfCode = TextEditingController();
    threeNumberOfCode = TextEditingController();
    fourNumberOfCode = TextEditingController();
    fiveNumberOfCode = TextEditingController();
    sexNumberOfCode = TextEditingController();
    oneFocusNode = FocusNode();
    twoFocusNode = FocusNode();
    threeFocusNode = FocusNode();
    fourFocusNode = FocusNode();
    fiveFocusNode = FocusNode();
    sexFocusNode = FocusNode();
  }

  @override
  void dispose() {
    oneNumberOfCode.dispose();
    twoNumberOfCode.dispose();
    threeNumberOfCode.dispose();
    fourNumberOfCode.dispose();
    fiveNumberOfCode.dispose();
    sexNumberOfCode.dispose();
    oneFocusNode.dispose();
    twoFocusNode.dispose();
    threeFocusNode.dispose();
    fourFocusNode.dispose();
    fiveFocusNode.dispose();
    sexFocusNode.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
    disposeVerificationCode();
  }

  void _verificationCode() {
    _verificationCodeInput = int.parse(
        '${oneNumberOfCode.text}${twoNumberOfCode.text}${threeNumberOfCode.text}${fourNumberOfCode.text}${fiveNumberOfCode.text}${sexNumberOfCode.text}');
    update();
  }

  void _diverVerifyButton(int id, int verificationCode) async {
    if (_checkData()) {
      _verificationCode();
      debugPrint('_verificationCodeInput:$_verificationCodeInput');
      debugPrint('verificationCode:$verificationCode');
      if (verificationCode == _verificationCodeInput) {
        Get.offAndToNamed(
          Routes.changePasswordScreen,
          arguments: [true, id],
        );
      } else {
        _incorrectEntered();
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterVerificationCode);
    }
  }

  void _policeVerifyButton(int id, int verificationCode) async {
    if (_checkData()) {
      _verificationCode();
      debugPrint('_verificationCodeInput:$_verificationCodeInput');
      debugPrint('verificationCode:$verificationCode');
      if (verificationCode == _verificationCodeInput) {
        Get.offAndToNamed(
          Routes.changePasswordScreen,
          arguments: [false, id],
        );
      } else {
        _incorrectEntered();
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterVerificationCode);
    }
  }

  void verifyButton(int id, bool isDriver, int verificationCode) async {
    if (isDriver) {
      _diverVerifyButton(id, verificationCode);
    } else {
      _policeVerifyButton(id, verificationCode);
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
      fiveFocusNode.requestFocus();
    } else {
      changeBorderColorFourFiled = false;
      threeFocusNode.requestFocus();
    }
    update();
  }

  void onChangeFiveFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorFiveFiled = true;
      sexFocusNode.requestFocus();
    } else {
      changeBorderColorFiveFiled = false;
      fourFocusNode.requestFocus();
    }
    update();
  }

  void onChangeSexFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorFourFiled = true;
    } else {
      changeBorderColorFourFiled = false;
      fiveFocusNode.requestFocus();
    }
    update();
  }

  void _incorrectEntered() {
    returnCodeIsInCorrect = true;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        returnCodeIsInCorrect = false;
        oneNumberOfCode.clear();
        twoNumberOfCode.clear();
        threeNumberOfCode.clear();
        fourNumberOfCode.clear();
        update();
      },
    );
  }

  bool _checkData() {
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
