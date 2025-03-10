import '/config/all_imports.dart';

abstract class RemoteOtpCodeDataSource {
  Future<OtpCodeResponse> sendOtpCode(SendOtpCodeRequest request);

  Future<OtpCodeResponse> verifyOtp(VerifyOtpRequest request);
}

class RemoteOtpCodeDataSourceImpl
    extends RemoteOtpCodeDataSource {
  final FBAuthentication _firebaseAuth;
  RemoteOtpCodeDataSourceImpl(
    this._firebaseAuth,
  );

  @override
  Future<OtpCodeResponse> sendOtpCode(request) async {
    return await _firebaseAuth.sendOtpCode(request.phoneNumber);
  }

  @override
  Future<OtpCodeResponse> verifyOtp(VerifyOtpRequest request) async {
    return await _firebaseAuth.verifyOTPCode(
        request.verificationId, request.smsCode);
  }
}
