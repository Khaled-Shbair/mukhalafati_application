import '/config/all_imports.dart';

class ChangePasswordController extends GetxController with CustomToast {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void onInit() {
    super.onInit();
    newPassword = TextEditingController()
      ..addListener(
        () => selectCursorPosition(newPassword),
      );
    confirmPassword = TextEditingController()
      ..addListener(
        () => selectCursorPosition(confirmPassword),
      );
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void backButton(BuildContext context) {
    context.pop();
    disposeChangePassword();
  }

  /// Check is driver or police man is send request to change password.
  /// if driver send request of this driver only.
  /// if police man send request of this police man only.
  void changePasswordButton(bool isDriver, int id, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (isDriver) {
        _changePasswordDriver(context, id);
      } else {
        _changePasswordPoliceMan(context, id);
      }
    }
  }

  void _changePasswordDriver(BuildContext context, int id) async {
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
        showToast(message: l.message, context: context);
      },

      /// Successfully change password for driver request
      (r) {
        _changedPasswordSuccessfully(context);
      },
    );
  }

  void _changePasswordPoliceMan(BuildContext context, int id) async {
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
        showToast(message: l.message, context: context);
      },

      /// Successfully change password for police man request
      (r) {
        _changedPasswordSuccessfully(context);
      },
    );
  }

  /// show dialog when return changed Password is Successfully
  void _changedPasswordSuccessfully(BuildContext context) {
    customCreatedSuccessfullyDialog(
      closeButton: () {
        context.pop();
        context.pop();
        disposeChangePassword();
      },
      context: context,
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
