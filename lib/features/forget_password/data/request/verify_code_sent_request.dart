class VerifyOtpRequest {
  final String smsCode;
  final String verificationId;

  VerifyOtpRequest({
    required this.verificationId,
    required this.smsCode,
  });
}
