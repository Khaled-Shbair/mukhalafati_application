import '/config/all_imports.dart';

class ChangePasswordController extends GetxController {
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

  void changePasswordButton() {
    createdSuccessfullyDialog(
      closeButton: () => Get.back(),
      context: Get.context!,
      text: ManagerStrings.passwordHasBeenChangedSuccessfully,
    );
  }

  void changeObscureNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    update();
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    update();
  }
}
