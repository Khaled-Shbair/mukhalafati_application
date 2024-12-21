import '/config/all_imports.dart';

class ForgotPasswordController extends GetxController with Helpers {
  final DriverForgotPasswordUseCase _useCaseDriverForgotPassword =
      instance<DriverForgotPasswordUseCase>();
  final PoliceManForgotPasswordUseCase _useCasePoliceManForgotPassword =
      instance<PoliceManForgotPasswordUseCase>();
  late TextEditingController licenseNumber;
  late TextEditingController jobNumber;

  final FirebaseAuth _firebaseAuth = instance<FirebaseAuth>();

  @override
  void onInit() {
    super.onInit();
    licenseNumber = TextEditingController();
    jobNumber = TextEditingController();
  }

  @override
  void onClose() {
    licenseNumber.dispose();
    jobNumber.dispose();
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
      if (_checkDataDriver()) {
        await initForgotPasswordForDriver();
        (await _useCaseDriverForgotPassword.execute(
                DriverForgotPasswordUseCaseInput(
                    licenseNumber: licenseNumber.text)))
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
                showSnackBar(
                    message:
                        '${ManagerStrings.verificationFailed}: ${e.message}',
                    context: context);
              },
              codeSent: (verificationId, forceResendingToken) {
                /// Split phone number to appear part of number only
                phoneNumber =
                    // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
                    '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';

                /// Remove forgot password controller form memory
                disposeForgotPassword();

                /// Navigate to verification code screen to input receive code
                Get.toNamed(
                  Routes.verificationCodeScreen,
                  arguments: [
                    phoneNumber,
                    r.driverId,
                    true,
                    verificationId,
                    //TODO: check if error
                    // 000000,
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
            message: ManagerStrings.pleaseEnterLicenseNumber, context: context);
      }
    } else {
      if (_checkDataPoliceMan()) {
        await initForgotPasswordForPoliceMan();
        (await _useCasePoliceManForgotPassword.execute(
                PoliceManForgotPasswordUseCaseInput(jobNumber: jobNumber.text)))
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
                /// Split phone number to appear part of number only
                phoneNumber =
                    // '${number.characters.characterAt(0)}${number.characters.characterAt(1)}${number.characters.characterAt(2)}*****${number.characters.characterAt(8)}${number.characters.characterAt(9)}';
                    '${phoneNumber.characters.characterAt(8)}${phoneNumber.characters.characterAt(9)}*****${phoneNumber.characters.characterAt(0)}${phoneNumber.characters.characterAt(1)}${phoneNumber.characters.characterAt(2)}';

                /// Remove forgot password controller form memory
                disposeForgotPassword();

                /// Navigate to verification code screen to input receive code
                Get.toNamed(
                  Routes.verificationCodeScreen,
                  arguments: [
                    phoneNumber,
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
  bool _checkDataDriver() {
    if (licenseNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /// check inputs user data in not empty
  bool _checkDataPoliceMan() {
    if (jobNumber.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
