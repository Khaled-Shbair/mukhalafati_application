import '/config/all_imports.dart';

class ForgotPasswordController extends GetxController with CustomToast {
  late TextEditingController _inputNumber;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get inputNumber => _inputNumber;

  @override
  void onInit() {
    super.onInit();
    _inputNumber = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_inputNumber);
        },
      );
  }

  @override
  void onClose() {
    _inputNumber.dispose();
    super.onClose();
  }

  void backButton(BuildContext context) {
    context.pop();
    disposeForgotPassword();
  }

  /// Check is driver or police man is send request to forgot password.
  /// if driver send request of this driver only.
  /// if police man send request of this police man only.
  void sendButton(bool isDriver, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      customLoading(context);
      if (isDriver) {
        _forgotPasswordDriver(context);
      } else {
        _forgotPasswordPoliceMan(context);
      }
    }
  }

  void _forgotPasswordDriver(BuildContext context) async {
    (await instance<DriverForgotPasswordUseCase>().execute(
            DriverForgotPasswordUseCaseInput(licenseNumber: _inputNumber.text)))
        .fold((l) {
      /// Close loading dialog
      context.pop();

      /// Appear message of error in SnackBar to user
      showToast(message: l.message, context: context);
    }, (r) async {
      /// Close loading dialog
      context.pop();

      /// Navigate to verification code screen to input receive code
      context.pushNamed(
        Routes.verificationCodeScreen,
        arguments: [
          /// Split phone number to appear part of number only
          r.phoneNumber,
          r.driverId,
          true,
        ],
      );
    });
  }

  void _forgotPasswordPoliceMan(BuildContext context) async {
    (await instance<PoliceManForgotPasswordUseCase>().execute(
            PoliceManForgotPasswordUseCaseInput(jobNumber: _inputNumber.text)))
        .fold(
      (l) {
        /// Close loading dialog
        context.pop();

        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: context);
      },
      (r) async {
        /// Close loading dialog
        context.pop();

        /// Navigate to verification code screen to input receive code
        context.pushNamed(
          Routes.verificationCodeScreen,
          arguments: [
            /// Split phone number to appear part of number only
            '${r.phoneNumber.characters.characterAt(8)}${r.phoneNumber.characters.characterAt(9)}*****${r.phoneNumber.characters.characterAt(0)}${r.phoneNumber.characters.characterAt(1)}${r.phoneNumber.characters.characterAt(2)}',
            r.policeManId,
            false,
          ],
        );
      },
    );
  }
}
