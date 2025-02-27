import '/config/all_imports.dart';

extension SendVerificationCodeMapper on SendVerificationCodeResponse {
  toDomain() {
    return SendVerificationCodeModel(
      code: code.onNull(),
    );
  }
}
