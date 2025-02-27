
import '/config/all_imports.dart';

extension UpdateFcmTokenMapper on UpdateFcmTokenResponse {
  toDomain() {
    return UpdateFcmTokenModel(
      status: status.onNull(),
      message: message.onNull(),
    );
  }
}
