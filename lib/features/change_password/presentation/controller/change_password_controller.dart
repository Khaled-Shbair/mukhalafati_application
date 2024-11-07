import '/config/all_imports.dart';

class ChangePasswordController extends GetxController with Helpers {
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
        await initDriverChangePassword();
        final DriverChangePasswordUseCase driverChangePasswordUseCase =
            instance<DriverChangePasswordUseCase>();
        (await driverChangePasswordUseCase.execute(
          DriverChangePasswordUseCaseInput(
            driverId: id,
            confirmPassword: confirmPassword.text,
            newPassword: newPassword.text,
          ),
        ))
            .fold(
          (l) {
            showSnackBar(message: l.message);
          },
          (r) {
            _changedPasswordSuccessfully();
          },
        );
      } else {
        await initPoliceManChangePassword();
        final PoliceManChangePasswordUseCase policeManChangePasswordUseCase =
            instance<PoliceManChangePasswordUseCase>();
        (await policeManChangePasswordUseCase.execute(
          PoliceManChangePasswordUseCaseInput(
            policeManId: id,
            confirmPassword: confirmPassword.text,
            newPassword: newPassword.text,
          ),
        ))
            .fold(
          (l) {
            showSnackBar(message: l.message);
          },
          (r) {
            _changedPasswordSuccessfully();
          },
        );
      }
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterNewPassword);
    }
  }

  void _changedPasswordSuccessfully() {
    createdSuccessfullyDialog(
      closeButton: () {
        disposeChangePassword();
        Get.offAndToNamed(Routes.loginScreen);
      },
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

  bool _checkDataDriver() {
    if (newPassword.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
