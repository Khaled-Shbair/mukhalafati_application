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
  void onClose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  void backButton() {
    /// Remove change password controller form memory
    disposeChangePassword();
    Get.back();
  }

  /// Check is driver or police man is send request to change password.
  /// if driver send request of this driver only.
  /// if police man send request of this police man only.
  void changePasswordButton(bool isDriver, int id, BuildContext context) async {
    if (_checkData()) {
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

            /// Failed change password for driver request
            .fold(
          (l) {
            /// Appear message of error in SnackBar to user
            showSnackBar(message: l.message, context: context);
          },

          /// Successfully change password for driver request
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
          /// Failed change password for police man request
          (l) {
            /// Appear message of error in SnackBar to user
            showSnackBar(message: l.message, context: context);
          },

          /// Successfully change password for police man request
          (r) {
            _changedPasswordSuccessfully();
          },
        );
      }
    } else {
      /// Appear message of error in SnackBar to user
      showSnackBar(
          message: ManagerStrings.pleaseEnterNewPassword, context: context);
    }
  }

  /// show dialog when return changed Password is Successfully
  void _changedPasswordSuccessfully() {
    createdSuccessfullyDialog(
      closeButton: () {
        /// Remove change password controller form memory
        disposeChangePassword();

        /// Navigate to login screen
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

  /// check inputs user data in not empty
  bool _checkData() {
    if (newPassword.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
