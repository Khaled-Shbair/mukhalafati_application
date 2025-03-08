import '/config/all_imports.dart';

class VerificationCodeController extends GetxController with CustomToast {
  final _verifyOTP = instance<VerifyOtpCodeUseCase>();
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

  void backButton(BuildContext context, bool isDriver) {
    context.pop();
    disposeVerificationCode();
  }

  /// Parse code input form user
  void _verificationCode() {
    _verificationCodeInput = int.parse(
        '${oneNumberOfCode.text}${twoNumberOfCode.text}${threeNumberOfCode.text}${fourNumberOfCode.text}${fiveNumberOfCode.text}${sexNumberOfCode.text}');
    update();
  }

  /// Check if input code is correct or incorrect.
  /// is correct? Navigate to change password screen.
  /// is incorrect? apply to [_incorrectEntered] function.
  void verifyButton(
    int id,
    bool isDriver,
    String verificationId,
    BuildContext context,
  ) async {
    if (_checkData()) {
      customLoading(context);
      _verificationCode();
      FocusScope.of(context).requestFocus(FocusNode());
      (await _verifyOTP.execute(VerifyOtpCodeUseCaseInput(
              verificationId: verificationId,
              smsCode: _verificationCodeInput.toString())))
          .fold(
        (l) {
          /// Close loading dialog
          context.pop();
          _incorrectEntered(context);
        },
        (r) {
          context.pop(); // close loading dialog

          context.pop(); // remove forgot password screen from stack

          /// Navigate to change password screen
          context.popAndPushNamed(
            Routes.changePasswordScreen,
            arguments: [isDriver, id],
          );
          disposeVerificationCode();
          disposeForgotPassword();
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showToast(
          message: ManagerStrings.pleaseEnterVerificationCode,
          context: context);
    }
    update();
  }

  /// Move to second field when fill first input field
  /// and change color of border
  void onChangeOneFiled(value) {
    if (value.isNotEmpty) {
      changeBorderColorOneFiled = true;
      twoFocusNode.requestFocus();
    } else {
      changeBorderColorOneFiled = false;
    }
    update();
  }

  /// Move to third field when fill second input field
  /// and change color of border
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

  /// Move to forth field when fill third input field
  /// and change color of border
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

  /// Move to fifty field when fill forth input field
  /// and change color of border
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

  /// Move to sixty field when fill fifty input field
  /// and change color of border
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

  /// Return to fifty field when sixty field is un-fill
  /// and change color of border
  void onChangeSexFiled(
    value,
    BuildContext context,
    int id,
    bool isDriver,
    String verificationId,
  ) {
    if (value.isNotEmpty) {
      changeBorderColorSexFiled = true;
      verifyButton(
        id,
        isDriver,
        verificationId,
        context,
      );
    } else {
      changeBorderColorSexFiled = false;
      fiveFocusNode.requestFocus();
    }
    update();
  }

  /// When user enter incorrect code:-
  /// appear error message and change image to incorrect image
  /// add timer 3 seconds, then hide message, return to previous image and
  /// clear field of input code.
  void _incorrectEntered(BuildContext context) {
    returnCodeIsInCorrect = true;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        returnCodeIsInCorrect = false;
        oneNumberOfCode.clear();
        twoNumberOfCode.clear();
        threeNumberOfCode.clear();
        fourNumberOfCode.clear();
        fiveNumberOfCode.clear();
        sexNumberOfCode.clear();
        if (context.mounted) {
          FocusScope.of(context).requestFocus(oneFocusNode);
        }
        update();
      },
    );
  }

  /// check inputs user data in not empty
  bool _checkData() {
    if (oneNumberOfCode.text.isNotEmpty &&
        twoNumberOfCode.text.isNotEmpty &&
        threeNumberOfCode.text.isNotEmpty &&
        fourNumberOfCode.text.isNotEmpty &&
        fiveNumberOfCode.text.isNotEmpty &&
        sexNumberOfCode.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
