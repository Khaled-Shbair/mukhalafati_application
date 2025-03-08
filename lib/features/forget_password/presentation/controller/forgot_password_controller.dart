import '/config/all_imports.dart';

class ForgotPasswordController extends GetxController with CustomToast {
  late TextEditingController _inputNumber;
  final _formKey = GlobalKey<FormState>();
  final _sendOtpCodeUseCase = instance<SendOtpCodeUseCase>();

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
      final phoneNumber = r.phoneNumber;
      final driverId = r.driverId;
      (await _sendOtpCodeUseCase
              .execute(SendOtpCodeUseCaseInput(phoneNumber: '+97$phoneNumber')))
          .fold(
        (l) {
          showToast(message: l.message, context: context);
        },
        (r) {
          if (r.message == 'loggedIn') {
            /// Close loading dialog
            context.pop();

            /// Navigate to change password screen
            context.pushReplacementNamed(
              Routes.changePasswordScreen,
              arguments: [true, driverId],
            );

            /// Remove forgot password controller form memory
            disposeForgotPassword();
          } else {
            /// Close loading dialog
            context.pop();

            /// Navigate to verification code screen to input receive code
            context.pushNamed(
              Routes.verificationCodeScreen,
              arguments: [
                /// Split phone number to appear part of number only
                '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
                driverId,
                true,
                r.message // verificationId
              ],
            );
          }
        },
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
        final phoneNumber = r.phoneNumber;
        final policeManId = r.policeManId;
        (await _sendOtpCodeUseCase.execute(
                SendOtpCodeUseCaseInput(phoneNumber: '+97$phoneNumber')))
            .fold(
          (l) {
            showToast(message: l.message, context: context);
          },
          (r) {
            if (r.message == 'loggedIn') {
              /// Close loading dialog
              context.pop();

              /// Navigate to change password screen
              context.pushReplacementNamed(
                Routes.changePasswordScreen,
                arguments: [true, policeManId],
              );

              /// Remove forgot password controller form memory
              disposeForgotPassword();
            } else {
              /// Close loading dialog
              context.pop();

              /// Navigate to verification code screen to input receive code
              context.pushNamed(
                Routes.verificationCodeScreen,
                arguments: [
                  /// Split phone number to appear part of number only
                  '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
                  policeManId,
                  false,
                  r.message // verificationId
                ],
              );
            }
          },
        );
      },
    );
  }
}
