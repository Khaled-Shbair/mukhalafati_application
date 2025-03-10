import '/config/all_imports.dart';

extension OtpCodeMapper on OtpCodeResponse {
  toDomain() {
    return OtpCodeModel(
      status: status.onNull(),
      message: message.onNull(),
    );
  }
}
