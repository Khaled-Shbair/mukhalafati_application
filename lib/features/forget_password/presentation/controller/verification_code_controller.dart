import '/config/all_imports.dart';

class VerificationCodeController extends GetxController with Helpers {
  final DriverDatabaseController _driverDatabase =
      instance<DriverDatabaseController>();
  final PoliceDatabaseController _policeDatabase =
      instance<PoliceDatabaseController>();
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

  void _diverVerifyButton(int id, int driverVerificationCode) async {
    if (_checkData()) {
      int enterVerificationCode = int.parse(
          '${oneNumberOfCode.text}${twoNumberOfCode.text}${threeNumberOfCode.text}${fourNumberOfCode.text}');
      DriverModel? driver = await _driverDatabase.driver(id);
      if (driver != null &&
          driver.driverVerificationCode == enterVerificationCode) {
        Get.offAndToNamed(
          Routes.changePasswordScreen,
          arguments: [true, id],
        );
      } else {
        _incorrectEntered();
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
    update();
  }

  void _policeVerifyButton(int id, int policeVerificationCode) async {
    if (_checkData()) {
      int enterVerificationCode = int.parse(
          '${oneNumberOfCode.text}${twoNumberOfCode.text}${threeNumberOfCode.text}${fourNumberOfCode.text}');
      PoliceModel? police = await _policeDatabase.police(id);
      if (police != null &&
          police.policeVerificationCode == enterVerificationCode) {
        Get.offAndToNamed(
          Routes.changePasswordScreen,
          arguments: [false, id],
        );
      } else {
        _incorrectEntered();
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterTheRequiredData);
    }
    update();
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
    } else {
      changeBorderColorFourFiled = false;
      threeFocusNode.requestFocus();
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
