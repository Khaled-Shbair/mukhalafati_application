import '/config/all_imports.dart';

class ForgotPasswordController extends GetxController with CustomToast {
  late TextEditingController _inputNumber;
  final _formKey = GlobalKey<FormState>();
  final _firebaseAuth = instance<FBAuthentication>();

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get inputNumber => _inputNumber;

  @override
  void onInit() {
    super.onInit();
    _inputNumber = TextEditingController();
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
      if (isDriver) {
        _forgotPasswordDriver(context);
      } else {
        // _forgotPasswordPoliceMan(context);
      }
    }
  }

  void _forgotPasswordDriver(BuildContext context) async {
    final DriverForgotPasswordUseCase useCase =
        instance<DriverForgotPasswordUseCase>();
    (await useCase.execute(
            DriverForgotPasswordUseCaseInput(licenseNumber: _inputNumber.text)))
        .fold(
      /// Failed forgot password for driver request
      (l) {
        /// Appear message of error in SnackBar to user
        showToast(message: l.message, context: context);
      },

      /// Successfully change password for driver request
      (r) async {
        String phoneNumber = r.phoneNumber;
        VerifyCodeSentResponse response = await _firebaseAuth.verifyPhoneNumber(
          VerifyCodeSentRequest(phoneNumber: '+97${r.phoneNumber}'),
        );
        if (response.status == false) {
          showToast(
            message: response.message,
            context: context,
          );
        } else {
          showToast(
            // message: '${ManagerStrings.verificationFailed}: ${e.message}',
            message: response.message,
            context: context,
          );

          /// Navigate to verification code screen to input receive code
          context.pushReplacementNamed(
            Routes.verificationCodeScreen,
            arguments: [
              /// Split phone number to appear part of number only
              // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}',
              '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
              r.driverId,
              true,
              response.message
            ],
          );

          /// Remove forgot password controller form memory
          disposeForgotPassword();
        }
      },
    );
  }

// void _forgotPasswordPoliceMan(BuildContext context) async {
//   final PoliceManForgotPasswordUseCase useCase =
//       instance<PoliceManForgotPasswordUseCase>();
//   (await useCase.execute(
//           PoliceManForgotPasswordUseCaseInput(jobNumber: _inputNumber.text)))
//       .fold(
//     /// Failed forgot password for police man request
//     (l) {
//       /// Appear message of error in SnackBar to user
//       showToast(message: l.message, context: context);
//     },
//
//     /// Successfully change password for driver request
//     (r) async {
//       String phoneNumber = r.phoneNumber;
//
//       await _firebaseAuth.verifyPhoneNumber(
//         verificationCompleted: (phoneAuthCredential) async {
//           await _firebaseAuth.signInWithCredential(phoneAuthCredential);
//         },
//         verificationFailed: (e) {
//           /// Appear message of error in SnackBar to user
//           showToast(
//               message: '${ManagerStrings.verificationFailed}: ${e.message}',
//               context: context);
//         },
//         codeSent: (verificationId, forceResendingToken) {
//           /// Remove forgot password controller form memory
//           disposeForgotPassword();
//
//           /// Navigate to verification code screen to input receive code
//           context.pushNamed(
//             Routes.verificationCodeScreen,
//             arguments: [
//               /// Split phone number to appear part of number only
//               // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}',
//               '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
//               r.policeManId,
//               true,
//               forceResendingToken,
//             ],
//           );
//         },
//         codeAutoRetrievalTimeout: (verificationId) {},
//         phoneNumber: phoneNumber,
//       );
//     },
//   );
// }
}
