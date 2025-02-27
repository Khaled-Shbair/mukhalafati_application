import 'dart:async';

import '/config/all_imports.dart';

class FBAuthentication {
  final FirebaseAuth _firebaseAuth;

  FBAuthentication(this._firebaseAuth);

  Future<VerifyCodeSentResponse> verifyPhoneNumber(
      VerifyCodeSentRequest request) async {
    try {
      final completer = Completer<VerifyCodeSentResponse>();

      await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) async {
          completer.complete(VerifyCodeSentResponse(
              message: '${ManagerStrings.verificationFailed}: ${ManagerStrings.badRequest}',
              status: false));
        },
        codeSent: (verificationId, resendToken) {
          PhoneAuthCredential s = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: resendToken.toString());
          print('ssss: ${s.smsCode}');
          print('OTP: $resendToken');

          completer.complete(
              VerifyCodeSentResponse(message: verificationId, status: true));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        phoneNumber: request.phoneNumber,
      );
      return completer.future;
    } catch (e) {
      return VerifyCodeSentResponse(status: false, message: e.toString());
    }
  }

  Future<bool> verifyOTP(String verificationId, String smsCode) async {
    try {
      // إنشاء Credential باستخدام verificationId والكود الذي أدخله المستخدم
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // تسجيل الدخول باستخدام الكود
      UserCredential user =
      await _firebaseAuth.signInWithCredential(credential);
      print('تم التحقق بنجاح!');

      if (user.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('فشل التحقق: ${e.toString()}');
      return false;
    }
  }
}
