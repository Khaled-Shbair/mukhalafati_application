import '/config/all_imports.dart';

class ChangePasswordController extends GetxController with Helpers {
  final DriverDatabaseController _driverDatabase =
      instance<DriverDatabaseController>();
  final PoliceDatabaseController _policeDatabase =
      instance<PoliceDatabaseController>();
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void onInit() {
    super.onInit();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void backButton() {
    Get.back();
  }

  void changePasswordButton(bool isDriver, int id) async {
    if (_checkDataDriver()) {
      if (isDriver) {
        await _driverDatabase.changePassword(newPassword.text, id);
      } else {
        await _policeDatabase.changePassword(newPassword.text, id);
      }
      createdSuccessfullyDialog(
        closeButton: () {
          Get.offAndToNamed(Routes.loginScreen);
        },
        context: Get.context!,
        text: ManagerStrings.passwordHasBeenChangedSuccessfully,
      );
    } else {
      showSnackBar(message: ManagerStrings.passwordDoesNotMatch);
    }
  }

  void changeObscureNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    update();
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    update();
  }

  bool _checkDataDriver() {
    if (newPassword.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
