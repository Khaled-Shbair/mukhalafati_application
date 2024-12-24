import '/config/all_imports.dart';

class ForgotPasswordController extends GetxController with Helpers {
  late TextEditingController inputNumber;

  final FirebaseAuth _firebaseAuth = instance<FirebaseAuth>();

  @override
  void onInit() {
    super.onInit();
    inputNumber = TextEditingController();
  }

  @override
  void onClose() {
    inputNumber.dispose();
    super.onClose();
  }

  void backButton() {
    /// Remove forgot password controller form memory
    disposeForgotPassword();
    Get.back();
  }

  /// Check is driver or police man is send request to forgot password.
  /// if driver send request of this driver only.
  /// if police man send request of this police man only.
  void sendButton(bool isDriver, BuildContext context) async {
    if (isDriver) {
      if (_checkData()) {
        final DriverForgotPasswordUseCase useCase =
            instance<DriverForgotPasswordUseCase>();
        (await useCase.execute(DriverForgotPasswordUseCaseInput(
                licenseNumber: inputNumber.text)))
            .fold(
          /// Failed forgot password for driver request
          (l) {
            /// Appear message of error in SnackBar to user
            showSnackBar(message: l.message, context: context);
          },

          /// Successfully change password for driver request
          (r) async {
            String phoneNumber = r.phoneNumber;
            await _firebaseAuth.verifyPhoneNumber(
              verificationCompleted: (phoneAuthCredential) async {
                await _firebaseAuth.signInWithCredential(phoneAuthCredential);
              },
              verificationFailed: (e) {
                debugPrint('verificationFailed: ${e.message}');
                showSnackBar(
                    message:
                        '${ManagerStrings.verificationFailed}: ${e.message}',
                    context: context);
              },
              codeSent: (verificationId, forceResendingToken) {
                /// Remove forgot password controller form memory
                disposeForgotPassword();

                /// Navigate to verification code screen to input receive code
                Get.toNamed(
                  Routes.verificationCodeScreen,
                  arguments: [
                    /// Split phone number to appear part of number only
                    // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}',
                    '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
                    r.driverId,
                    true,
                    verificationId,
                  ],
                );
              },
              codeAutoRetrievalTimeout: (verificationId) {},
              phoneNumber: '+97$phoneNumber',
            );
          },
        );
      } else {
        /// Appear message of error in SnackBar to user
        showSnackBar(
            message: ManagerStrings.pleaseEnterLicenseNumber, context: context);
      }
    } else {
      if (_checkData()) {
        final PoliceManForgotPasswordUseCase useCase =
            instance<PoliceManForgotPasswordUseCase>();
        (await useCase.execute(PoliceManForgotPasswordUseCaseInput(
                jobNumber: inputNumber.text)))
            .fold(
          /// Failed forgot password for police man request
          (l) {
            /// Appear message of error in SnackBar to user
            showSnackBar(message: l.message, context: context);
          },

          /// Successfully change password for driver request
          (r) async {
            String phoneNumber = r.phoneNumber;

            await _firebaseAuth.verifyPhoneNumber(
              verificationCompleted: (phoneAuthCredential) async {
                await _firebaseAuth.signInWithCredential(phoneAuthCredential);
              },
              verificationFailed: (e) {
                /// Appear message of error in SnackBar to user
                showSnackBar(
                    message:
                        '${ManagerStrings.verificationFailed}: ${e.message}',
                    context: context);
              },
              codeSent: (verificationId, forceResendingToken) {
                /// Remove forgot password controller form memory
                disposeForgotPassword();

                /// Navigate to verification code screen to input receive code
                Get.toNamed(
                  Routes.verificationCodeScreen,
                  arguments: [
                    /// Split phone number to appear part of number only
                    // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}',
                    '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}',
                    r.policeManId,
                    true,
                    verificationId,
                  ],
                );
              },
              codeAutoRetrievalTimeout: (verificationId) {},
              phoneNumber: phoneNumber,
            );
          },
        );
      } else {
        /// Appear message of error in SnackBar to user
        showSnackBar(
            message: ManagerStrings.pleaseEnterJobNumber, context: context);
      }
    }
  }

  /// check inputs user data in not empty
  bool _checkData() {
    if (inputNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
