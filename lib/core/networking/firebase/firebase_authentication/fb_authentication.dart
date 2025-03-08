import 'dart:async';

import '/config/all_imports.dart';

class FBAuthentication {
  final FirebaseAuth _firebaseAuth;

  FBAuthentication(this._firebaseAuth);

  Future<OtpCodeResponse> sendOtpCode(String phoneNumber) async {
    try {
      final result = Completer<OtpCodeResponse>();
      // Initiate phone number verification using Firebase Authentication.
      await _firebaseAuth.verifyPhoneNumber(
        // Call when verification is automatically completed
        // (e.g., on Android with SMS autofill).
        verificationCompleted: (phoneAuthCredential) async {
          // Sign in the user using the automatically retrieved credentials.
          UserCredential user =
              await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          if (user.user != null) {
            result.complete(OtpCodeResponse(status: true, message: 'loggedIn'));
          }
        },
        // Call when verification fails (e.g., invalid phone number).
        verificationFailed: (FirebaseAuthException e) async {},
        // Call when the SMS code is successfully sent.
        codeSent: (verificationId, resendToken) {
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: resendToken.toString(),
          );

          // Verification initiated successfully,
          // return a success response with (verificationId).
          result.complete(
            OtpCodeResponse(
                status: true, message: phoneAuthCredential.verificationId),
          );
        },
        // Call when the auto-retrieval timeout occurs.
        codeAutoRetrievalTimeout: (verificationId) {},
        // The phone number to verify.
        phoneNumber: phoneNumber,
      );
      return result.future;
    } catch (e) {
      // Catch any errors that occur during the verification process.
      // Return an error response with the error message.
      return OtpCodeResponse(status: false, message: e.toString());
    }
  }

  Future<OtpCodeResponse> verifyOTPCode(
      String verificationId, String smsCode) async {
    try {
      // Create phone authentication credentials using verificationId and smsCode.
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, //Verification ID obtained from Firebase
        smsCode: smsCode, // SMS code entered by the user.
      );

      // Sign in the user using the created credentials.
      // Firebase will verify the SMS code during this process.
      UserCredential user =
          await _firebaseAuth.signInWithCredential(credential);
      // Check if the user sign-in was successful.
      if (user.user != null && user.user?.phoneNumber != null) {
        // Sign-in successful, SMS code is valid.
        return OtpCodeResponse(status: true, message: 'تم التحقق بنجاح');
      } else {
        // Sign-in failed, SMS code is invalid.
        return OtpCodeResponse(
            status: false, message: ManagerStrings.theEnteredCodeIsIncorrect);
      }
    } catch (e) {
      // Catch any errors that occur during the verification process.
      // Return an error response with the error message.
      return OtpCodeResponse(status: false, message: e.toString());
    }
  }
}
